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

class FlashingState extends FlxState {
    var isYes:Bool = true;
    
    override public function create():Void {
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/mobile/#2.png");
        add(bg);

        final enter:String = (controls.mobileC) ? 'A' : 'ENTER';
        final flash:String = (controls.mobileC) ? 'B' : 'FLASH';
        final back:String = (controls.mobileC) ? 'C' : 'BACK';

        #if TOUCH_CONTROLS_ALLOWED
        addTouchPad("NONE", "A_B_C");
        #end
    }

    override public function update(elapsed:Float):Void
	{
        #if android
	if (enter)
	    FlxG.switchState(new states.flashingStates.mobile.android.CheckOS());
        if (flash)
            FlxG.switchState(new states.flashingStates.mobile.android.CheckOS());
            ClientPrefs.data.flashing = !isYes;
	    ClientPrefs.saveSettings();
        #elseif ios
        if (enter)
		FlxG.switchState(new states.flashingStates.mobile.ios.CheckOS());
        if (flash)
            FlxG.switchState(new states.flashingStates.mobile.ios.CheckOS());
            ClientPrefs.data.flashing = !isYes;
	    ClientPrefs.saveSettings();
        #end
                
        if (back)
            openfl.Lib.application.window.close();
        
	super.update(elapsed);
	}
}