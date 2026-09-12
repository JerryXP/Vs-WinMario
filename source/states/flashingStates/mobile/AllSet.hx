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

class AllSet extends FlxState {
    var transitioning:Bool = false;
    var enterTimer:FlxTimer;
    public static var closedState:Bool = false;

	public function new()
	{
	   final enter:String = controls.mobileC ? 'A' : 'ENTER';
       final back:String = controls.mobileC ? 'B' : 'BACK';
	}
    
    override public function create():Void {
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/mobile/#4.png");
        add(bg);

        addTouchPad("NONE", "A");
    }

    override public function update(elapsed:Float):Void
	{
		if (enter)
			videoButton.color = FlxColor.WHITE;
				videoButton.alpha = 1;

				if (videoButton != null)
					videoButton.animation.play('flashing');

				FlxG.camera.flash(mikolka.compatibility.VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

				transitioning = true;
				// FlxG.sound.music.stop();

				enterTimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
                    FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.switchState(new states.IntroVideoState());

					closedState = true;
				});
        
		super.update(elapsed);
	}
}