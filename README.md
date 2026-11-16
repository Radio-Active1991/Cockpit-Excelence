# Cockpit Excelence

Configurable cockpit displays and physical controls for **Flyout**.

**Public0.4.3** · Windows x64 / .NET6 IL2CPP ·70original parts

[Download](https://github.com/Radio-Active1991/Cockpit-Excelence/releases/latest) · [Wiki](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki) · [SDK/examples](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/Mod-Integration-and-SDK)

Created by **Radio-Active1991** with extensive programming, debugging,
original-model and documentation assistance from **OpenAI ChatGPT / Codex**.
GPL-3.0: [LICENSE](LICENSE).

## Build your cockpit

- MFDs, HUDs, UFCs, warning panels, buttons, switches, knobs, real number drums,
  LED values, gated H/ratchet shifters, slider, arc lever and trim handwheel.
- Styles inspired by F/A-18, F-16A, Gripen, Eurofighter, Tornado, Soviet
  instruments, Rafale, F-22, F-35 and JF-17; editable pages and F-35 split layout.
- Flight/engine/fuel/stores/radar/RWR/navigation pages, transferable pages,
  shared bezel shortcuts, scrolling, warnings/tones and supported stock actions.
- HUD modes, masks, tapes, radar-altitude factors and per-part FoV; UFC decimal
  or degree/minute coordinates; AP IAS/TAS/Mach targets on MFD/UFC/LED/drums.
- Native motor/rocket/gearbox data, gear/clutch controls and separate gear LEDs.
- Resolution/refresh/work limits, required-axis polling, unchanged-image reuse
  and exterior-view freezing. Functional warnings/inputs remain active.
- **Display SDK v1:** publish images/drawing commands into a normal widget;
  three simple examples included in the complete Source ZIP, under Source/SDK.

These are Flyout-adapted configurable instruments, not full reference-aircraft
avionics simulations. Cameras/FLIR/Mi8 video and native GPS targeting remain
**WIP**. This is exclusively a cockpit mod.

![Actual owned part models](docs/parts-preview.png)

## New in0.4.3

Cockpit layout edits save automatically; new editor parts register immediately
and edits flush before launch. Native aircraft Save still retains placement,
size and newly created axes. New HUDs start at10degree FoV; saved values remain.
Own EO filters (BW/NV), gain/contrast and command zoom remain WIP.

Revised paintable slider, curved lever with three grips and approved smooth,
closed trim wheel retain the original bindings. Wheel indicator/crank hide
independently and mounting can mirror with readable text. Scale/number color
and pointer/rim color are separate; the lower number is hideable.

Control image reuse avoids redraws for subpixel/rounded-value noise without
rounding functional outputs. Repeated identical materials share a clone within
one part. Safe Reload reads the primary file, preserves open edits on failure
and prevents stale native appearance values from overriding the loaded layout.

## Downloads

| Attached release asset | Contents |
| --- | --- |
| **Cockpit-Excelence-0.4.3.zip** | Only gamefiles, installation and license notices |
| **Cockpit-Excelence-0.4.3-Source.zip** | Complete source, tests, model tools/assets, bilingual help and SDK/examples |

**SHA-256 hashes appear in the release text.** No separate SDK, update,
checksum or report attachments are published for0.4.3. Players need only the
first ZIP. Install both Mods and Parts; preserve UserData, layouts and aircraft.
Technical FlyoutMFD.dll and part IDs remain compatible.

[Installation](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/Installation) · [Release notes](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/Release-0.4.3) · [Controls](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/Drums-Slider-and-Potentiometer) · [HUD FoV](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/HUD#adjusting-hud-fov) · [Performance](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/Performance)

## Verification and limits

0.4.3 passed11793controlled checks in17suites,215compiled production
contracts,911native references/14normal hooks and9445Unity proxy paths.
222approved-control-model and586UFC geometry checks pass. All70parts are
byte-identical to the accepted internal.5 assets. Source rebuild and independent
SDK/example checks accompany the release verification.

Controlled checks execute owned managed code/doubles; no native game/mod DLL
was executed or game started by Codex. They do not establish in-game GPU,
physics, visual acceptance or a particular FPS gain. Report versions,
reproduction steps and relevant log excerpts for problems.

Full source is the named Source ZIP, not GitHub's automatic repository snapshot.
No foreign game/loader/mod binaries, private development log or third-party
reference photograph is distributed.
