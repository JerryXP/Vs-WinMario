package states;

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

class LoginStateFlash extends FlxState {
    var transitioning:Bool = false;
    var enterTimer:FlxTimer;
    public static var closedState:Bool = false;
    private var continueNOW:FlxButton;
    
    override public function create():Void {
        FlxG.camera.flash(mikolka.compatibility.VsliceOptions.FLASHBANG ? FlxColor.BLACK : 0x4C000000, 1);
        FlxG.mouse.visible = true;
        super.create();

        #if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("THANK YOU FOR DOWNLOADING MY MOD!!!", null);
		#end
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/#1.png");
        add(bg);

        // Continue button
        continueNOW = new FlxButton(600, 680, "Continue", startGame);
        continueNOW.color = FlxColor.GREEN;
        continueNOW.label.color = FlxColor.WHITE;
        add(continueNOW);
    }

    function startGame():Void {
            FlxG.switchState(new states.flashingStates.AgreeTerms());
    }
}