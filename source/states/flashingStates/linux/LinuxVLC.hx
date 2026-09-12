package states.flashingStates.linux;

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

class LinuxVLC extends FlxState {
    private var continueLinux:FlxButton;
    private var exitLinux:FlxButton;
    
    override public function create():Void {
        FlxG.mouse.visible = true;
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/vlc-linux.png");
        add(bg);

        // Yes button
        continueLinux = new FlxButton(600, 640, "I dont have LibVLC", loadHelp);
        continueLinux.color = FlxColor.RED;
        continueLinux.label.color = FlxColor.WHITE;
        add(continueLinux);

        // No button
        exitLinux = new FlxButton(600, 680, "I have LibVLC", startGame);
        add(exitLinux);
    }

    function loadHelp():Void {
            FlxG.switchState(new states.flashingStates.linux.VLCHelp());
    }

    function startGame():Void {
            FlxG.switchState(new states.flashingStates.AllSet());
    }
}