package states.errorDektops;

#if LEGACY_PSYCH
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

class OhNoLegacyPsych extends FlxState {
    
    override public function create():Void {
        FlxG.mouse.visible = false;
        super.create();

        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/empty.png");
        add(bg);

        var message:FlxSprite = new FlxSprite(0, 0);
        message.loadGraphic("assets/shared/images/desktop/pop-up/legacy-psych-warning.png"); // Use AssetPaths or a raw string "assets/images/player.png"
        message.screenCenter();
        add(message);

        #if TOUCH_CONTROLS_ALLOWED
        #if !ios
		host.addTouchPad('NONE', 'A_B');
        #else
		host.addTouchPad('NONE', 'A');
        #end

        #if !ios
        final enter:String = (controls.mobileC) ? 'A' : 'ENTER';
        final back:String = (controls.mobileC) ? 'B' : 'BACK';
        #else
        final enter:String = (controls.mobileC) ? 'A' : 'ENTER';
		#end
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Check if Enter OR Escape was just pressed
        if (FlxG.keys.anyJustPressed([ENTER]) || #if TOUCH_CONTROLS_ALLOWED enter #end)
        {
            // Load a different state (e.g., MenuState)
            FlxG.switchState(new states.StopandThink());
        }
        if (FlxG.keys.anyJustPressed([ESCAPE]) || #if TOUCH_CONTROLS_ALLOWED #if !ios back #end #end )
        {
            // Load a different state (e.g., MenuState)
            openfl.Lib.application.window.close();
        }
    }
}
#end