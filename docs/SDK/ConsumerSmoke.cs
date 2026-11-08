using System;
using FlyoutMFD;
static class ConsumerSmoke
{
    static int Main()
    {
        if(ExternalDisplays.ApiVersion!=1)throw new Exception("API version");
        using(var hello=new HelloDisplayProvider())using(var image=new RgbaDisplayProvider()){
            hello.Tick();image.Tick();
            if(hello.SourceKey!="hello-mod/hello"||image.SourceKey!="image-mod/pattern"||ExternalDisplays.Sources.Count!=2||ExternalDisplays.ImageBytes!=160*80*4)throw new Exception("Documented SDK examples");
        }
        using(var example=new DisplayProviderExample()){
            example.Tick(123.4f);
            if(example.SourceKey!="example-mod/status"||ExternalDisplays.Sources.Count!=1)throw new Exception("Sample registration");
        }
        using(var source=ExternalDisplays.Register("consumer", "test", "Independent BCL consumer")){
            if(!source.PublishDrawing(64,64,new[]{ExternalDrawCommand.Text(1,1,"SDK",0xFFFFFF,12)}))throw new Exception(source.LastError);
            if(!source.PublishRgba(1,1,new byte[]{255,0,0,255})||ExternalDisplays.ImageBytes!=4)throw new Exception("RGBA");
            if(source.PublishRgba(1,1,new byte[3])||string.IsNullOrEmpty(source.LastError))throw new Exception("Validation");
            if(!source.KeepAlive())throw new Exception("Heartbeat");
        }
        if(ExternalDisplays.Sources.Count!=0||ExternalDisplays.ImageBytes!=0)throw new Exception("Cleanup");
        Console.WriteLine("PASS: independent public API consumer and three documented examples; no game/Unity/Melon references loaded.");return 0;
    }
}
