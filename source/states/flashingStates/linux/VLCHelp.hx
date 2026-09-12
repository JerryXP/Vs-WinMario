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

class VLCHelp extends FlxState {
    private var buttonHelp:FlxButton;
    private var buttonDone:FlxButton;
    private var iLied:FlxButton;
    
    override public function create():Void {
        FlxG.mouse.visible = true;
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/vlc-linux_install.png");
        add(bg);

        // Help button
        buttonHelp = new FlxButton(0, 0, "Help", loadHelp);
        buttonHelp.color = FlxColor.BLUE;
        buttonHelp.label.color = FlxColor.WHITE;
        add(buttonHelp);

        // Done button
        buttonDone = new FlxButton(0, 40, "Exit", terminateGame);
        buttonDone.color = FlxColor.RED;
        buttonDone.label.color = FlxColor.WHITE;
        add(buttonDone);

        // Wrong option button
        iLied = new FlxButton(0, 80, "I have LibVLC", startGame);
        add(iLied);
    }

    function loadHelp():Void {
            CoolUtil.browserLoad('https://docs.google.com/document/d/1iMfpvFETQik2K-KaNjJRkdSI6OmFS8KcQRgfJ8HYNfw/edit?usp=sharing');
    }

    function terminateGame():Void {
            openfl.Lib.application.window.close();
    }

    function startGame():Void {
            FlxG.switchState(new states.flashingStates.AllSet());
    }
}