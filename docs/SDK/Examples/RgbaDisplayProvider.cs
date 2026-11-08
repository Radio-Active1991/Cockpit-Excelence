// SPDX-License-Identifier: GPL-3.0-only
using System;
using FlyoutMFD;

// Publish a tiny original test image once, with a text overlay.
public sealed class RgbaDisplayProvider : IDisposable
{
    readonly ExternalDisplayChannel display;
    public string SourceKey => display.Key;
    public RgbaDisplayProvider()
    {
        display = ExternalDisplays.Register("image-mod", "pattern", "RGBA test pattern");
        const int width = 160, height = 80;
        byte[] rgba = new byte[width * height * 4];
        for (int y = 0; y < height; y++) for (int x = 0; x < width; x++) {
            int at = (y * width + x) * 4;
            rgba[at] = (byte)(x * 255 / (width - 1));
            rgba[at + 1] = (byte)(y * 255 / (height - 1));
            rgba[at + 2] = 40;
            rgba[at + 3] = 255;
        }
        bool ok = display.PublishFrame(width, height, rgba, new[] {
            ExternalDrawCommand.Text(8, 8, "RGBA IMAGE", 0xFFFFFF, 12)
        }, topDown: true);
        if (!ok) { string error = display.LastError; display.Dispose(); throw new InvalidOperationException(error); }
        // The host copied rgba; this producer can now release or reuse its buffer.
    }
    public void Tick() => display.KeepAlive();
    public void Dispose() => display.Dispose();
}
