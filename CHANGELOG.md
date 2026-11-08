# Cockpit Excelence 0.4.2

- Public Display API v1 and External mod content widgets. Separate SDK ZIP with three simple providers, independent consumer check, build template and optional loader-demo source. Registry, drawing/RGBA layers, fit modes, lifetime/error handling, budgets and demand hints documented in the expanded wiki.
- Native stock rocket/electric machinery and gearbox signals, optional compatible Airframe machinery bridge, gear/clutch control and physical H-pattern/ratchet shifters with configurable native slot maps/interlocks.
- Refined true gated H plate, connected ratchet lever/grip, page/gate/label colors, optional reverse gate and separate freely placed LED gear indication. H lever travels through the middle cross-channel.
- Per-UFC decimal-degree or degree/minute input/display, implied decimal positions and hemisphere keys. Complete JF17 coordinate side keys, round F16 ENT/0/CLR, centred F22/Rafale multiline legends, half-height Rafale/F22/JF17 keys and Gripen dot legend. Custom mappings retained.
- Additional optical-pod direction/lock and one-shot GPS target commands preserve stock pathways; cameras/FLIR/native GPS positioning remain explicitly WIP.
- Public UI hides internal comparison/diagnostic controls. Technical part/DLL IDs and layout paths remain stable. Update DLL and Parts together; retain saves.
- Expanded wiki covers SDK setup/examples, coordinate walkthroughs, gearbox/shifter setup and current source groups. Existing resolution/refresh and HUD FoV guides retained. Bilingual in-game/exported help included; source and SDK are separate downloads.
- 8184controlled checks,586model/layout checks,154compiled contracts,894native references/13existing hooks and9151proxy paths pass on inspected0.2504metadata. No measured FPS gain claimed. GPL-3.0; created with OpenAI ChatGPT / Codex assistance.

# Cockpit Excelence 0.4.1

- Renamed the public mod while preserving FlyoutMFD.dll, native part keys/folders, page format and saved-data paths. Assembly version 0.4.1.6 follows internal.5.
- Removed internal diagnostic panels/comparison controls from the public UI; detailed diagnostics and native timing sampling default off.
- Added native AP targets for heading, altitude, IAS, TAS, Mach, active speed and speed reference. LED/drum sources, MFD actions and physical controls use them. Speed-reference changes use native conversion and preserve engagement/other holds.
- Physical knobs show target bounds in the mod’s units. Active-speed knobs have a separate Mach range; LED/drum Mach decimals adapt without changing saved whole-speed formatting.
- The physical counter now retains the same native, paintable housing used in the hangar. Real default digit cylinders and attached screws match the live mechanical counter. Static wheels are replaced by owned moving wheels in flight.
- Made UFC/MFD screen surrounds flatter and flush with each case; mini LED surround is flush. Kept control faces, apertures, UVs, sunshades and native part identities.
- New part configurations hide screws; explicit saved visibility is preserved. Brighter 400px previews render the actual models with screws hidden.
- Pitch-ladder exclusions now follow Mach, g, vertical speed, AP, radar range and configurable weapon/mode/status readouts, in addition to compass, speed/altitude and tapes.
- Retained internal.5 corrections: demand-based axis reads/shared caches, simple panel reuse, modular stores/hardpoints, external native-wing capture fallback, hidden control and HUD-FOV persistence, independent tape spacing and radar-altitude factor.
- Updated shared German/English help and external installation instructions. Cameras remain WIP. No measured in-game/FPS improvement is claimed.
