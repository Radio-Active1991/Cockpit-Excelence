// SPDX-License-Identifier: GPL-3.0-only
// Optional synthetic demo. This assembly is not included in the runtime ZIP.
using System;
using MelonLoader;
[assembly: MelonInfo(typeof(CockpitExcelenceDisplayDemo), "Cockpit Excelence API Demo", "0.4.2", "Radio-Active1991 / OpenAI Codex assistance")]
[assembly: MelonGame(null, "Flyout")]
[assembly: MelonAdditionalDependencies(new string[] { "FlyoutMFD" })]
public sealed class CockpitExcelenceDisplayDemo : MelonMod
{
    DisplayProviderExample source;
    public override void OnInitializeMelon()
    {
        try {
            source = new DisplayProviderExample();
            LoggerInstance.Msg("Synthetic display demo registered: example-mod/status. Select External mod content; values are demonstration data, not aircraft telemetry.");
        } catch(Exception error) { LoggerInstance.Error(error.ToString()); }
    }
    public override void OnUpdate()
    {
        if(source == null) return;
        try { source.Tick((Environment.TickCount64 % 60000) * .006f); }
        catch(Exception error) { LoggerInstance.Error(error.ToString()); source.Dispose(); source = null; }
    }
    public override void OnDeinitializeMelon() { source?.Dispose(); source = null; }
}
