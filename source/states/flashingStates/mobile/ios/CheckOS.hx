package states.flashingStates.mobile.ios;

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

    public function new()
	{
        final enter:String = (controls.mobileC) ? 'A' : 'ENTER';
	}
    
    override public function create():Void {
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/mobile/#3-ios.png");
        add(bg);

        addTouchPad("NONE", "A");
    }

    override public function update(elapsed:Float):Void
	{
		if (enter)
			FlxG.switchState(new states.flashingStates.mobile.ios.AppleWarning());
        
		super.update(elapsed);
	}
}