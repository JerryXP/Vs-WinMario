package states.flashingStates;

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

class AgreeTerms extends FlxState {
    private var continueMac:FlxButton;
    private var exitMac:FlxButton;
    
    private var fnf:FlxButton;
    var clockText:FlxText;
    
    override public function create():Void {
        FlxG.mouse.visible = true;
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/#1.5.png");
        add(bg);

        // Yes button
        continueMac = new FlxButton(600, 640, "Agree", startGame);
        continueMac.color = FlxColor.GREEN;
        continueMac.label.color = FlxColor.WHITE;
        add(continueMac);

        // No button
        exitMac = new FlxButton(600, 680, "Disagree", exitGame);
        exitMac.color = FlxColor.RED;
        exitMac.label.color = FlxColor.WHITE;
        add(exitMac);
    }

    function startGame():Void {
            FlxG.switchState(new states.flashingStates.FlashingState());
    }

    function exitGame():Void {
            openfl.Lib.application.window.close();
    }
}