# Cockpit Excelence0.4.3 — Installation / Installation

## Deutsch

Für Flyout0.2504 / MelonLoader0.7.1 (.NET6 IL2CPP, Windows x64).
MelonLoader und die passende .NET6-Desktop-Runtime müssen eingerichtet sein.

1. Flyout vollständig schließen. Alte FlyoutMFD.dll, eigene Mod-Parts und
   Cockpitlayouts/Flugzeugdateien außerhalb der Ladeordner sichern.
2. Mods/FlyoutMFD.dll aus dem ZIP in den Mods-Ordner der Spielinstallation
   kopieren und die bisherige DLL ersetzen. Keine zweite umbenannte Kopie laden.
3. Alle70Ordner aus Parts nach
   %USERPROFILE%/AppData/LocalLow/Stonext Games/Flyout/Mods/Parts kopieren.
   Gleichnamige Dateien ersetzen; andere Parts nicht löschen. Die bisherigen
   Namen Flyout MFD Studio... bleiben für gespeicherte Flugzeuge absichtlich.
4. UserData/FlyoutMFD, editor-settings.json und Craft/.../FlyoutMFD/layout.json
   beibehalten. Flugzeuge/Seiten/Belegungen müssen nicht neu erstellt werden.
5. Flyout selbst starten. Cockpit-Editor: Strg+F8 oder Stock-Teilmenü.

Cockpitlayout-Änderungen speichern automatisch und werden vor Launch gesichert.
Flyouts Flugzeug-Save bleibt für Teileposition, Größe und neue Achsen nötig.
Neue HUDs starten mit10Grad FoV; vorhandene Werte werden erhalten.
Trimrad: Displays > PART APPEARANCE bietet getrennte Scale / number color und
Pointer / rim mark color sowie Show handwheel numeric value für die untere Zahl.
Anzeige/Gehäuse und Kurbel sind unabhängig ausblendbar; Spiegelung und Green
band from/to bleiben verfügbar. Slider/Bogenhebel/Trimrad verwenden vorhandene
Achsen-/Systemausgänge. EO-Filter und Zoom sind unter Kamera/EO-Ausgängen.

## English

Requires Flyout0.2504 / MelonLoader0.7.1 (.NET6 IL2CPP, Windows x64) and the
matching .NET6 Desktop Runtime.

1. Close Flyout and back up the prior DLL, this mod's Parts and layouts/aircraft
   outside the loading folders.
2. Replace Mods/FlyoutMFD.dll in your game installation's Mods folder.
   Never load a second renamed copy.
3. Copy all70Parts folders into
   %USERPROFILE%/AppData/LocalLow/Stonext Games/Flyout/Mods/Parts.
   Replace matching files; keep other mods' parts. Old technical names remain.
4. Keep UserData/FlyoutMFD, editor-settings.json and aircraft layout sidecars.
5. Start Flyout yourself. Open the cockpit editor with Ctrl+F8 or the stock menu.

Cockpit layouts save automatically and flush before launch. Native aircraft
Save is still required for placement, size and new axes. New HUDs default to
10degree FoV; saved custom values remain. Trim-wheel scale/number and pointer/
rim colors are separate under Displays > PART APPEARANCE; Show handwheel numeric
value hides the bottom number. Indicator/bow and crank hide independently.
Mirror/green band settings remain. Slider/arc/wheel use existing outputs.

## Source, license and limits

Complete source, tests, original models/tools, bilingual help and developer
SDK/examples are in Cockpit-Excelence-0.4.3-Source.zip (Source/SDK). Players
need only the gamefiles ZIP. SHA-256 hashes are written in the GitHub release
text; no separate SDK or checksum asset is required.

Public UI hides internal comparison/diagnostic settings. Camera/FLIR, filters,
Mi8 video and native GPS targeting remain WIP. Controlled offline checks do not
establish native GPU/physics behavior or FPS gains. No game was started by Codex.
GPL-3.0; created with extensive OpenAI ChatGPT / Codex assistance.
