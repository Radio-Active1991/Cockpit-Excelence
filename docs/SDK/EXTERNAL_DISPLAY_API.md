# External display API v1 — Cockpit Excelence 0.4.2

Cockpit Excelence exposes a render-only source registry in **FlyoutMFD.dll**,
namespace `FlyoutMFD`. It is included in public0.4.2 and absent from public0.4.1.
The matching SDK ZIP contains three simple producer examples, a standalone
consumer check, a project template and an optional MelonLoader demo source.
These checks verify the managed API; they do not establish native rendering
or performance for a particular producer mod. Cameras/FLIR remain WIP.
Created with OpenAI ChatGPT / Codex assistance; GPL-3.0, see LICENSE.

## Connect a source

Reference the matching FlyoutMFD.dll when compiling your mod. The public API
uses only .NET types: no Unity, MelonLoader or Flyout types are required to
compile a producer. The host must already be loaded; integrations using a
direct reference must document this dependency. Do not bundle or load a
second copy of FlyoutMFD.dll. See DisplayProviderExample.cs for a small
producer class to call from your mod's update/unload callbacks.

```csharp
using FlyoutMFD;
var channel = ExternalDisplays.Register("my-mod", "status", "My status screen");
channel.PublishDrawing(320, 240, new[] {
    ExternalDrawCommand.Rectangle(0, 0, 320, 240, 0x001000, true),
    ExternalDrawCommand.Line(10, 60, 310, 60, 0x00FF00),
    ExternalDrawCommand.Text(10, 20, "READY", 0x00FF00, 20)
});
// Call channel.Dispose() when your mod unloads. It is safe to call twice.
```

Owner/id are1–64 ASCII letters/digits or `.` / `_` / `-`, joined into a
case-insensitive stable key such as `my-mod/status`. Display name is1–96
characters. Registration rejects duplicates; `TryRegister` reports an error
without throwing. `Sources` is a read-only metadata snapshot for selectors.
Keep one channel per source, rather than registering every frame.

See README.md for setup and SDK/Examples for small working classes. Keep your
provider instance until unload; disposing a temporary local handle unregisters
the source immediately. Direct-reference MelonMods should declare the loader
dependency on `FlyoutMFD`; DisplayDemoMod.cs shows the attribute supported by
the inspected MelonLoader baseline. Version-match the host and SDK. The SDK
reference DLL is for building/testing, not a second DLL to install with a mod.

In the cockpit editor, add **External mod content**, select the source or
enter its stable key, and choose Contain, Stretch or Cover. The normal MFD
page schedule, power state and external-view freeze apply. A source can
appear on several pages, including independent F-35 halves. This is a raster
MFD/UFC-page feature, not a collimated HUD projection or a physical drum.
Live pages require the host's normal active-aircraft data; the editor can
use preview data. Registration alone does not activate or replace a page.

## Images and drawings

```csharp
byte[] rgba = new byte[320 * 240 * 4]; // Reuse your own buffer.
// Fill tightly packed RGBA8 with straight alpha; rows normally start at top.
bool ok = channel.PublishRgba(320, 240, rgba, topDown: true);
// Or combine the image and overlay commands atomically:
ok = channel.PublishFrame(320, 240, rgba, new[] {
    ExternalDrawCommand.Ellipse(140, 100, 40, 40, 0xFFFF00),
    ExternalDrawCommand.Text(10, 10, "TARGET", 0xFFFFFF, 16)
});
if (!ok) { string reason = channel.LastError; /* Log at a bounded rate. */ }
```

Coordinates are canvas pixels with top-left origin; RGB is0xRRGGBB.
Line uses two endpoints. Rectangle/Ellipse use x,y,width,height and optional
fill/thickness. Text uses the widget's configured host font, with requested
canvas text height. The host clips drawing to the widget and scales it with
the chosen fit mode. Outlined primitives and text have minimum raster sizes.
There is no arbitrary callback, script, custom shader, GPU-texture handle,
camera ownership or readback contract in v1.

`PublishRgba` replaces any prior commands; `PublishDrawing` releases any
prior image. `PublishFrame` commits both layers. Images and command arrays
are copied before a successful return; callers may then reuse them, but
must not mutate a buffer concurrently with its publication. Same-size image
publications reuse the host's owned buffer. Rejecting a bad frame preserves
the previous good frame. `LastError` is per channel, not a per-thread result.

## Lifetime, threading and performance

- Registration, publication, snapshots and disposal are synchronized.
  Your worker can publish data; do not call game APIs from that worker.
  The renderer holds a channel lock while composing one widget, so a busy
  producer/large canvas can delay both sides. No producer code is invoked
  by the renderer. Dispose only your own handle.
- `IsRequested` means some widget requested this source during the previous
  two seconds. It is a demand hint, not an exact visibility signal. It
  eventually becomes false on hidden/frozen pages. `RequestedWidth` and
  `RequestedHeight` are the most recent widget request, not all consumers.
- Cap your own publication rate and avoid per-frame allocations. Publish
  on changes, at a suitable low rate, and honor the demand hint. A static
  frame can use `KeepAlive()` periodically without copying image data.
- Default stale timeout is10seconds;0 retains the last frame indefinitely.
  Missing, waiting and stale sources have recoverable status states.
  Matching stable IDs reconnect after a producer re-registers.
- Limits:32 sources,1024x1024 per canvas,512 commands per frame,
  256characters per text command /8192 per frame,16MiB of retained image
  buffers globally. Finite coordinates are limited to +/-4096; shape sizes
  are nonnegative, line/shape thickness1–16 and text height1–144.
- These limits bound retained host data, not arbitrary producer CPU work or
  total process memory. Commands are copied on publication. Image scaling
  and drawing use the existing **CPU raster → GPU display texture** path;
  this is not a GPU renderer conversion or a promised performance gain.

## Verification

SDK/Run-Smoke.ps1 compiles a separate .NET consumer using only system
references plus this host DLL and executes its public registry/publication
API without game dependencies. It loads only the newly built owned host
assembly, not installed game/mod assemblies. Production compositor tests
also cover MFD pages, split halves, alpha, thread safety and saved source IDs.
These offline checks do not establish in-game appearance, FPS or native
camera behavior.
