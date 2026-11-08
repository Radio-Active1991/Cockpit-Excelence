// SPDX-License-Identifier: GPL-3.0-only
// Call Tick from your own mod's update; dispose from your mod's unload callback.
// Reference the host FlyoutMFD.dll; never ship a second copy with your mod.
using System;
using FlyoutMFD;

public sealed class DisplayProviderExample : IDisposable
{
    readonly ExternalDisplayChannel channel;
    long nextUpdate;
    public string SourceKey => channel.Key;
    public DisplayProviderExample()
    {
        channel = ExternalDisplays.Register("example-mod", "status", "Example navigation status");
    }
    public void Tick(float headingDegrees)
    {
        long now = Environment.TickCount64;
        if (now < nextUpdate) return;
        nextUpdate = now + 100; // At most10 publications per second.
        if (!channel.IsRequested) { channel.KeepAlive(); return; }
        // Rebuild commands only at your chosen rate, not inside a host callback.
        bool ok = channel.PublishDrawing(512, 256, new[] {
            ExternalDrawCommand.Rectangle(0, 0, 512, 256, 0x001020, true),
            ExternalDrawCommand.Rectangle(8, 8, 496, 240, 0x00FF80),
            ExternalDrawCommand.Text(24, 24, "EXAMPLE NAV", 0x00FF80, 24),
            ExternalDrawCommand.Text(24, 72, "HDG " + headingDegrees.ToString("000.0", System.Globalization.CultureInfo.InvariantCulture), 0xFFFFFF, 30),
            ExternalDrawCommand.Line(24, 120, 488, 120, 0x00FF80)
        });
        if (!ok) throw new InvalidOperationException(channel.LastError);
    }
    public void Dispose() => channel.Dispose();
}
