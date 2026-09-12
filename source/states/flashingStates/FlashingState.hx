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

class FlashingState extends FlxState {
    private var continue1:FlxButton;
    private var continue2:FlxButton;
    private var exitFlash:FlxButton;
    var isYes:Bool = true;
    
    override public function create():Void {
        FlxG.mouse.visible = true;
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/#2.png");
        add(bg);

        // Yes button
        continue1 = new FlxButton(600, 600, "Yes", startGame);
        continue1.color = FlxColor.GREEN;
        continue1.label.color = FlxColor.WHITE;
        add(continue1);

        // Yes but Flashing Lights Off
        continue2 = new FlxButton(600, 640, "No Flash", startGameNoFlash);
        continue2.color = FlxColor.YELLOW;
        continue2.label.color = FlxColor.BLACK;
        add(continue2);

        //No Exit Game
        exitFlash = new FlxButton(600, 680, "No", exitGame);
        exitFlash.color = FlxColor.RED;
        exitFlash.label.color = FlxColor.WHITE;
        add(exitFlash);
    }

    #if windows
    function startGame():Void {
            FlxG.switchState(new states.flashingStates.windows.CheckOS());
    }
    function startGameNoFlash():Void {
            FlxG.switchState(new states.flashingStates.windows.CheckOS());
            ClientPrefs.data.flashing = !isYes;
	    ClientPrefs.saveSettings();
    }
    #elseif mac
    function startGame():Void {
            FlxG.switchState(new states.flashingStates.mac.CheckOS());
    }
    function startGameNoFlash():Void {
            FlxG.switchState(new states.flashingStates.mac.CheckOS());
            ClientPrefs.data.flashing = !isYes;
	    ClientPrefs.saveSettings();
    }
    #elseif linux
    function startGame():Void {
            FlxG.switchState(new states.flashingStates.linux.CheckOS());
    }
    function startGameNoFlash():Void {
            FlxG.switchState(new states.flashingStates.linux.CheckOS());
            ClientPrefs.data.flashing = !isYes;
	    ClientPrefs.saveSettings();
    }
    #elseif (html5 || web)
    function startGame():Void {
            FlxG.switchState(new states.flashingStates.AllSet());
    }
    function startGameNoFlash():Void {
            FlxG.switchState(new states.flashingStates.AllSet());
            ClientPrefs.data.flashing = !isYes;
	    ClientPrefs.saveSettings();
    }
    #end
    
    function exitGame():Void {
            openfl.Lib.application.window.close();
    }
}