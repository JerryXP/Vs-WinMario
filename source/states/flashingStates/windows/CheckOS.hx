package states.flashingStates.windows;

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

class CheckOS extends FlxState {
    private var windowsStart:FlxButton;

    override public function create():Void {
        FlxG.mouse.visible = true;
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/#3-windows.png");
        add(bg);

        windowsStart = new FlxButton(0, 683, "Continue", windowsLoad);
        windowsStart.color = FlxColor.GREEN;
        windowsStart.label.color = FlxColor.WHITE;
        add(windowsStart);
    }

    function windowsLoad():Void {
            FlxG.switchState(new states.flashingStates.AllSet());
    }
}