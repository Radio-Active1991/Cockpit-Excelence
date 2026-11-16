# Cockpit Excelence 0.4.3 — Display SDK v1

This SDK lets another mod supply images, text and drawing commands to a normal
Cockpit Excelence MFD/UFC page. Download the matching Runtime ZIP separately.
The SDK is included in the complete Source ZIP under Source/SDK; players need only the runtime ZIP.

Created with OpenAI ChatGPT / Codex assistance. GPL-3.0; see LICENSE/NOTICE.

## Quick start

1. Install Cockpit Excelence **0.4.3** normally, including Mods and Parts.
2. Reference the matching installed or freshly compiled `FlyoutMFD.dll` when compiling your producer. Its
   version is the same as the runtime DLL; do not redistribute a second copy.
3. Copy a provider class from `Source/SDK/Examples`, or use `DisplayProviderExample.cs`.
   Create one instance at mod startup, call its Tick method from your update
   callback and Dispose it when your mod unloads. Keep the instance alive.
4. In the cockpit editor, select a page, add **External mod content**, choose
   the registered source and save. A source can appear in more than one widget.

Examples and the exact editor keys:

| Example | Source key | What it shows |
| --- | --- | --- |
| HelloDisplayProvider | `hello-mod/hello` | Static text, background rectangle and line |
| RgbaDisplayProvider | `image-mod/pattern` | Original RGBA gradient image plus text overlay |
| DisplayProviderExample | `example-mod/status` | Heading text updated at up to 10 publications/s when requested |

The examples publish synthetic content, not native telemetry. The RGBA buffer
is raw, tightly packed pixel data, not encoded PNG/JPEG bytes. Image rows use
top-left origin by default. The host makes its own copy of published data.

## Build and check without the game

Requires **PowerShell 7** and the **.NET 6 runtime** installed locally. From
the extracted SDK ZIP root:

```powershell
pwsh -File ./SDK/Run-Smoke.ps1
```

This compiles and runs an independent consumer plus all three provider
examples using system references and the included owned host DLL only. It
does not install/start Flyout or load game/Unity/MelonLoader libraries.
It checks registration, simple drawings, RGBA publication, validation and
cleanup. The generated files go under `SDK/smoke-results`.

With a .NET 6-compatible **SDK** installed, the optional library template is:

```powershell
dotnet build ./SDK/ExampleProvider.csproj -c Release
```

The template compiles provider classes, not an automatically loaded MelonMod.
`Private=false` prevents copying the host DLL into that producer output.
If using this SDK folder from Source.zip, supply your host path explicitly:

```powershell
pwsh -File ./Source/SDK/Run-Smoke.ps1 -HostDLL ./your-build/FlyoutMFD.dll
dotnet build ./Source/SDK/ExampleProvider.csproj -p:FlyoutMfdAssembly=C:/path/to/FlyoutMFD.dll
```

## Optional MelonLoader demo

`DisplayDemoMod.cs` illustrates initialization, update and unload callbacks.
It declares an additional dependency on the `FlyoutMFD` assembly. Compile it
only against your own compatible Flyout/MelonLoader installation:

```powershell
pwsh -File ./SDK/Build-Demo.ps1 -GamePath 'C:/path/to/Flyout'
```

Install the resulting `CockpitExcelenceSdkDemo.dll` yourself only if you want
to try the synthetic `example-mod/status` source. The SDK does not install
that demo and the Runtime ZIP does not contain it. In Source.zip, also pass
`-HostDLL` to the matching built host. A real integration still needs testing
in your own mod, loader lifecycle and cockpit layout.

## Practical limits

- Keep one channel per stable owner/id. Registering each frame causes duplicate
  registration errors. Dispose only channels you own.
- Publish only on change or at a bounded rate. `IsRequested` is a two-second
  demand hint, not an exact visibility signal. `KeepAlive()` refreshes a static
  frame without copying it again; for static pages, the widget's stale timeout
  can also be set to 0 to retain the frame.
- Your worker may publish immutable/captured data. Do not call native game APIs
  from a worker or mutate an input buffer concurrently with publication.
- The widget shares normal host page refresh limits, power and external-view
  freezing. Publishing at 60 Hz does not force a 60 Hz screen update.
- API v1 is render-only: no pointer callbacks, native controls, arbitrary
  callbacks/shaders or GPU texture/camera handles. It is not a GPU-renderer
  replacement. Cameras/FLIR/native GPS positioning remain WIP.

See [EXTERNAL_DISPLAY_API.md](EXTERNAL_DISPLAY_API.md) for the complete
contract, limits, errors and lifetime rules, and the [wiki examples](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/SDK-Examples).

## Deutsch: Kurzablauf

Das SDK liegt in Source.zip unter Source/SDK und ist für Mod-Entwickler; zum Spielen reicht das Spielpaket.
Den passenden Host referenzieren, eine Quelle einmal registrieren, Bilder
oder Zeichenbefehle veröffentlichen und die Quelle im Widget **External mod
content** auswählen. Die Anbieterinstanz bis zum Entladen aufbewahren und
dann freigeben. Host-DLL, SDK und Beispielversion müssen zusammenpassen.
Keine zweite FlyoutMFD.dll mit dem eigenen Mod verteilen. Die drei oben
genannten Beispielquellen und die ausführlichen Wiki-Beispiele helfen beim
Einstieg. Bildqualität und Aktualisierungsgrenzen stellt der Anwender im
Cockpit-Editor ein; Kameras/FLIR bleiben WIP.
