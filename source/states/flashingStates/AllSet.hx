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
    private var continueButton:FlxButton;
    private var loginButton:FlxButton;
    private var videoButton:FlxButton;
    private var titleButton:FlxButton;
    var transitioning:Bool = false;
    var enterTimer:FlxTimer;
    public static var closedState:Bool = false;
    
    override public function create():Void {
        FlxG.camera.flash(mikolka.compatibility.VsliceOptions.FLASHBANG ? FlxColor.BLACK : 0x4C000000, 1);
        FlxG.mouse.visible = true;
        super.create();
        
        var bg:FlxSprite = new FlxSprite(0, 0);
        bg.loadGraphic("assets/shared/images/desktop/_flash/#4.png");
        add(bg);

        // Desktop button
        continueButton = new FlxButton(600, 600, "Enter Desktop", startGame);
        continueButton.color = FlxColor.BLUE;
        continueButton.label.color = FlxColor.WHITE;
        add(continueButton);

        // Login button
        loginButton = new FlxButton(600, 620, "Go to Login", loginstartGame);
        loginButton.color = FlxColor.GREEN;
        loginButton.label.color = FlxColor.WHITE;
        add(loginButton);

        // Intro Video button
        videoButton = new FlxButton(600, 640, "Get to the Intro", videostartGame);
        videoButton.color = FlxColor.YELLOW;
        videoButton.label.color = FlxColor.WHITE;
        add(videoButton);

        // Intro Video button
        titleButton = new FlxButton(600, 660, "Go To Title.", titlestartGame);
        titleButton.color = FlxColor.RED;
        titleButton.label.color = FlxColor.WHITE;
        add(titleButton);
    }

    function startGame():Void {
				continueButton.color = FlxColor.WHITE;
				continueButton.alpha = 1;

				if (continueButton != null)
					continueButton.animation.play('flashing');

				FlxG.camera.flash(mikolka.compatibility.VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

				transitioning = true;
				// FlxG.sound.music.stop();

				enterTimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
                    FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.switchState(new states.DesktopState());

					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}

    function loginstartGame():Void {
				loginButton.color = FlxColor.WHITE;
				loginButton.alpha = 1;

				if (loginButton != null)
					loginButton.animation.play('flashing');

				FlxG.camera.flash(mikolka.compatibility.VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

				transitioning = true;
				// FlxG.sound.music.stop();

				enterTimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
                    FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.switchState(new states.LoginState());

					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}

    function videostartGame():Void {
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
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}

    function titlestartGame():Void {
				titleButton.color = FlxColor.WHITE;
				titleButton.alpha = 1;

				if (titleButton != null)
					titleButton.animation.play('flashing');

				FlxG.camera.flash(mikolka.compatibility.VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);

				transitioning = true;
				// FlxG.sound.music.stop();

				enterTimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
                	FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.switchState(new mikolka.vslice.ui.title.TitleState());

					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}
}