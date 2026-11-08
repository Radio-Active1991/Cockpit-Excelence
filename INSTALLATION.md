# Cockpit Excelence 0.4.2 — Installation

## Deutsch

Cockpit Excelence 0.4.2 für Flyout 0.2504 / MelonLoader 0.7.1 (.NET 6 IL2CPP). MelonLoader und die passende .NET-6-Desktop-Runtime müssen eingerichtet sein. Interne Testversion: Das Spielpaket enthält die DLL und alle 68 Parts sowie diese Anleitung und GPL-Hinweise. Quellcode, Tests, Modellwerkzeuge und SDK liegen ausschließlich in der getrennten Source.zip. Flyout 0.2504 wurde auf API-Ebene offline geprüft; native Darstellung und Zielbewegung sind noch nicht im Spiel abgenommen.

1. Flyout vollständig schließen. Bisherige Mods/FlyoutMFD.dll und die zu diesem Mod gehörenden Parts außerhalb ihrer Ladeordner sichern. Eigene Layouts und Flugzeugdateien ebenfalls sichern.
2. Mods/FlyoutMFD.dll aus dem Paket in den Mods-Ordner der Spielinstallation kopieren. Eine vorhandene DLL ersetzen; keine zweite umbenannte Kopie parallel laden.
3. Alle Ordner aus Parts in %USERPROFILE%/AppData/LocalLow/Stonext Games/Flyout/Mods/Parts kopieren und gleichnamige Dateien ersetzen. Ordner wie Flyout MFD Studio Fa18 behalten absichtlich ihre bisherigen Namen. Nicht die gesamte Parts-Bibliothek löschen.
4. Layouts unter UserData/FlyoutMFD, editor-settings.json und Flugzeugdateien behalten. Die Namensänderung benötigt kein neues Cockpit. Schrauben bleiben bei ausdrücklich gespeicherter Auswahl erhalten; für neue Konfigurationen sind sie aus.
5. Flyout selbst starten und die geänderten Teile an einem gesicherten Flugzeug prüfen. Zum Rückwechsel das Spiel schließen und gesicherte DLL sowie zugehörige Parts gemeinsam wiederherstellen.

Kameras sind ausdrücklich WIP. Es gibt keine bestätigte FPS-Steigerung oder vollständige Ingame-Abnahme aus den Offline-Prüfungen. Codex hat dieses Paket weder installiert noch das Spiel gestartet. Offizielle Loader-Anleitung: https://github.com/LavaGang/MelonLoader .

DLL und Parts gemeinsam aktualisieren. Layouts, UserData und Flugzeugdateien
behalten. Die technischen Kennungen und Speicherpfade sind unverändert.
Das Runtime-ZIP enthält alle zum Spielen benötigten Mod-Dateien und Hinweise.
Quellcode und SDK sind getrennte ZIPs. Das SDK ist nur für Entwickler;
seine Referenz-DLL nicht als zweite Kopie ins Spiel installieren.

## English

Cockpit Excelence 0.4.2 for Flyout 0.2504 / MelonLoader 0.7.1 (.NET 6 IL2CPP). Install MelonLoader and the matching .NET 6 Desktop Runtime first. Internal test version: the runtime package contains the DLL, all 68 parts, this guide and GPL notices. Source, tests, model tools and SDK are exclusively in the separate Source.zip. Flyout0.2504 compatibility was inspected offline; native rendering and target motion are not yet accepted in flight.

1. Close Flyout completely. Back up Mods/FlyoutMFD.dll and this mod’s existing part folders outside their loading directories. Also back up your layouts and aircraft saves.
2. Copy Mods/FlyoutMFD.dll into the game installation’s Mods folder, replacing the old DLL. Do not load a second renamed copy.
3. Copy every folder from Parts into %USERPROFILE%/AppData/LocalLow/Stonext Games/Flyout/Mods/Parts and replace matching files. Names such as Flyout MFD Studio Fa18 deliberately remain unchanged. Do not delete your entire parts library.
4. Preserve layouts in UserData/FlyoutMFD, editor-settings.json and aircraft saves. Renaming the mod does not require rebuilding your cockpit. Explicitly saved screw visibility is retained; new configurations hide screws.
5. Start Flyout yourself and check the revised parts on a backed-up aircraft. To revert, close the game and restore the saved DLL and matching parts together.

Cameras are explicitly WIP. Offline checks establish neither a measured FPS improvement nor full in-game acceptance. Codex has not installed this package or started the game. Official loader instructions: https://github.com/LavaGang/MelonLoader .

Update DLL and Parts together. Retain layouts, UserData and aircraft saves.
Technical IDs/storage paths remain stable. This runtime ZIP contains the
required game files and notices. Complete source and optional developer SDK
are separate archives. Do not install a second host DLL from the SDK.

## Documentation and limitations

https://github.com/Radio-Active1991/Cockpit-Excelence/wiki

New: display-provider SDK v1 with simple examples, native machinery/gearbox
sources and physical shifters, per-UFC coordinate formats and revised models.
Configure image resolution/refresh under Settings and HUD angular scale in
the HUD widget; see wiki. Cameras/FLIR/native GPS positioning remain WIP.
No FPS improvement is promised. Offline checks and exact hashes accompany
the release; this build is not installed or launched by Codex.

GPL-3.0. Created with OpenAI ChatGPT / Codex assistance. See LICENSE/NOTICE.
