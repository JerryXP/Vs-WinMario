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

class AppleWarning extends FlxState {
    var isYes:Bool = true;
    
    public function new()
	{
        final enter:String = (controls.mobileC) ? 'A' : 'ENTER';
        final back:String = (controls.mobileC) ? 'B' : 'BACK';
	}

    override public function create():Void {
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/mobile/warning-ios.png");
        add(bg);

        addTouchPad("NONE", "A_B");
    }

    override public function update(elapsed:Float):Void
	{
		if (enter)
			FlxG.switchState(new states.flashingStates.mobile.AllSet());
        if (back)
			openfl.Lib.application.window.close();
        
		super.update(elapsed);
	}
}