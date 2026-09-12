package states.errorDektops;

import flixel.ui.FlxButton;
import flixel.FlxState;
import lime.app.Application;
import flixel.FlxG;
import flixel.text.FlxText;
import haxe.Timer;
import DateTools;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;

class OhNoDesktop extends FlxState {
    
    override public function create():Void {
        FlxG.mouse.visible = false;
        super.create();

        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/empty.png");
        add(bg);

        var message:FlxSprite = new FlxSprite(0, 0);
        message.loadGraphic("assets/shared/images/desktop/pop-up/jerry32-deleted (desktop).png"); // Use AssetPaths or a raw string "assets/images/player.png"
        message.screenCenter();
        add(message);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Check if Enter OR Escape was just pressed
        if (FlxG.keys.anyJustPressed([ENTER]))
        {
            // Load a different state (e.g., MenuState)
            FlxG.switchState(new states.IntroVideoState());
        }
        if (FlxG.keys.anyJustPressed([ESCAPE]))
        {
            // Load a different state (e.g., MenuState)
            openfl.Lib.application.window.close();
        }
    }
}