// SPDX-License-Identifier: GPL-3.0-only
using System;
using FlyoutMFD;

// Create once when your mod starts; Tick from update; Dispose on unload.
public sealed class HelloDisplayProvider : IDisposable
{
    readonly ExternalDisplayChannel display;
    public string SourceKey => display.Key;
    public HelloDisplayProvider()
    {
        display = ExternalDisplays.Register("hello-mod", "hello", "Hello cockpit");
        bool ok = display.PublishDrawing(320, 160, new[] {
            ExternalDrawCommand.Rectangle(0, 0, 320, 160, 0x001020, true),
            ExternalDrawCommand.Text(24, 24, "HELLO COCKPIT", 0x00FF80, 22),
            ExternalDrawCommand.Line(24, 60, 296, 60, 0x00FF80)
        });
        if (!ok) { string error = display.LastError; display.Dispose(); throw new InvalidOperationException(error); }
    }
    // For this static frame, call about once per second to prevent a stale status.
    public void Tick() => display.KeepAlive();
    public void Dispose() => display.Dispose();
}
