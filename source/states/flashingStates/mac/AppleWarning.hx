package states.flashingStates.mac;

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

class AppleWarning extends FlxState {
    private var continueMac:FlxButton;
    private var exitMac:FlxButton;
    var isYes:Bool = true;
    
    private var fnf:FlxButton;
    var clockText:FlxText;
    
    override public function create():Void {
        FlxG.mouse.visible = true;
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/warning-mac.png");
        add(bg);

        // Yes button
        continueMac = new FlxButton(600, 640, "Yes", startGame);
        continueMac.color = FlxColor.GREEN;
        continueMac.label.color = FlxColor.WHITE;
        add(continueMac);

        // No button
        exitMac = new FlxButton(600, 680, "No", exitGame);
        exitMac.color = FlxColor.RED;
        exitMac.label.color = FlxColor.WHITE;
        add(exitMac);
    }

    function startGame():Void {
            FlxG.switchState(new states.flashingStates.AllSet());
    }

    function exitGame():Void {
            openfl.Lib.application.window.close();
    }
}