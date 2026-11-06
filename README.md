# Cockpit Excelence

Configurable cockpit displays and physical controls for **Flyout**.

**Current public version:0.4.1** · **Windows x64 / .NET6 IL2CPP**

[Download](https://github.com/Radio-Active1991/Cockpit-Excelence/releases/latest) · [Wiki](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki) · [Report an issue](https://github.com/Radio-Active1991/Cockpit-Excelence/issues)

Created by **Radio-Active1991** with extensive development, debugging,
original-model and documentation assistance from **OpenAI ChatGPT / Codex**.

## Build your cockpit

-66 original instrument/control parts: MFDs, HUDs, UFCs, warning panels,
  switches, buttons, knobs, sliders, LED values and physical number drums.
- Aircraft-inspired styles: F/A-18, early F-16A, Gripen, Eurofighter, Tornado,
  Soviet designs, Rafale, F-22, F-35 and JF-17.
- Editable pages with flight, engine, grouped-fuel, stores, radar, RWR,
  navigation and weapon information. Export/import pages between aircraft.
- Shared bezel buttons, scrollable lists and independent F-35 display halves.
- Configurable HUD modes, reticles, scaling, radar altitude, tapes and masks.
- Native AP targets on LED/drums, physical target adjustment and IAS/TAS/Mach.
- Warning outputs and tones, stall alerts, stock cockpit control actions.
- Adjustable display budgets, required-axis polling and external-view freeze.

These are configurable Flyout-adapted instruments, not complete simulations
of the reference aircraft’s avionics. Cameras/FLIR/Mi8 video are **WIP**.

![Actual owned part models](docs/parts-preview.png)

## Install

Download **Cockpit-Excelence-0.4.1.zip** from Releases. It contains the game
files and installation/license notices. Install **both Mods and Parts** in
their respective locations: [installation guide](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/Installation).
The game Mods directory and user Parts directory are different folders.
Preserve your layouts and aircraft. Stable part IDs and FlyoutMFD.dll remain
unchanged despite the public rename.

The matching **Cockpit-Excelence-0.4.1-Source.zip** contains the corresponding
source, tests and original model tools separately. See [GPL-3.0](https://github.com/Radio-Active1991/Cockpit-Excelence/blob/main/LICENSE)
and [source/build information](https://github.com/Radio-Active1991/Cockpit-Excelence/wiki/License-and-Source).

## Verification and limits

The original0.4.1 release passed7765 controlled C# checks and104 compiled
wiring checks. A later read-only check against Flyout0.2504 resolved all841
direct API references and13 native hooks; rebuilding produced the same DLL.
These are offline checks, not confirmed native rendering, flight behavior
or measured FPS improvements. Include versions, reproduction steps and a
relevant log excerpt when reporting problems.

The external-content API and additional one-shot FLIR/GPS commands are being
prepared in an **internal test version**; they are not part of public0.4.1.

No Flyout, MelonLoader or Mi8 binaries, foreign reference models or private
development logs are included. Install the game and loader separately.
