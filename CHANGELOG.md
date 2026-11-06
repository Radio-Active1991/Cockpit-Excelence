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
