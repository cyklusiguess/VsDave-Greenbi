package;

#if sys
import sys.io.File;
import sys.io.Process;
import Sys;
#end

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import haxe.Timer;
import Paths;
import MusicBeatState;
import lime.app.Application;

class YouCheatedSomeoneIsComing extends MusicBeatState
{
    var holyshit:FlxSprite;
    var endTriggered:Bool = false;
    var timeSinceEndTriggered:Float = 0; // tiemstamp????????????????????????????

    public function new() 
    {
        super();
    }

    override public function create():Void 
    {
        super.create();

        if (FlxG.sound.music != null)
            FlxG.sound.music.stop();

        FlxG.sound.playMusic(Paths.music('badEnding'), 1, true);

        var spooky:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('Screenshot_20250619_214434'));
        spooky.screenCenter();
        add(spooky);

        holyshit = new FlxSprite(0, 0).loadGraphic(Paths.image('VERT_Employment-Job-Application'));
        holyshit.width = FlxG.stage.stageWidth;
        holyshit.height = FlxG.stage.stageHeight;
        holyshit.updateHitbox();
    }

    override public function update(elapsed:Float):Void 
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER && !endTriggered)
        {
            endIt();
        }

        if (endTriggered)
        {
            timeSinceEndTriggered += elapsed;

            Application.current.window.title = randString(FlxG.random.int(8, 16));
            Application.current.window.x += FlxG.random.int(-20, 20);
            Application.current.window.y += FlxG.random.int(-20, 20);

            if (timeSinceEndTriggered > 0.7) // this works :3
            {
                Sys.exit(0);
            }
        }
    }

    public function endIt():Void
    {
        endTriggered = true;
        timeSinceEndTriggered = 0;

        add(holyshit);
        FlxG.sound.play("assets/sounds/scarysound.ogg");
    }

    public static function randString(length:Int):String
    {
        var string = '';
        var data = 'qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPASDFGHJKLZXCVBNM';

        for (i in 0...length)
        {
            string += data.charAt(FlxG.random.int(0, data.length - 1));
        }
        return string;
    }
}
