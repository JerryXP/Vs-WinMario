package states.flashingStates.mobile;

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

    public function new()
	{
		final enter:String = controls.mobileC ? 'A' : 'ENTER';
	}
    
    override public function create():Void {
        FlxG.camera.flash(mikolka.compatibility.VsliceOptions.FLASHBANG ? FlxColor.BLACK : 0x4C000000, 1);
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/mobile/#1.png");
        add(bg);

        addTouchPad("NONE", "A");
    }

    override public function update(elapsed:Float):Void
	{
		if (enter)
			FlxG.switchState(new states.flashingStates.mobile.AgreeTerms());
        
		super.update(elapsed);
	}
}