package states;

import flixel.ui.FlxButton;
import lime.app.Application;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import mikolka.vslice.ui.MainMenuState;
import funkin.vis.dsp.SpectralAnalyzer;
import backend.LocaleUtils;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import haxe.Timer;
import DateTools;
import mikolka.compatibility.VsliceOptions;

class LoginStateStrict extends FlxState {
    private var button1:FlxButton;
    private var button2:FlxButton;
    private var button3:FlxButton;
	private var button4:FlxButton;
    private var button5:FlxButton;
    private var button6:FlxButton;
	private var button7:FlxButton;
    private var button8:FlxButton;
    private var button9:FlxButton;
	private var button10:FlxButton;
	var password:FlxText;
	var wrong1:FlxText;
	var wrong2:FlxText;
	var clockText:FlxText;
	var wrong3:FlxText;
	var wrong4:FlxText;
    #if debug
    private var testSetup:FlxButton;
    private var testMobileSetup:FlxButton;
    #end
    
    var transitioning:Bool = false;
    var enterTimer:FlxTimer;
    public static var closedState:Bool = false;
	var dateTimeText:FlxText;

	var _vizBars:FlxTypedGroup<FlxSprite>;
	var _analyzer:SpectralAnalyzer = null;
	var _analyzerLevels:Array<funkin.vis.dsp.SpectralAnalyzer.Bar> = null;
	var _needsAnalyzerInit:Bool = false;
	static inline var VIZ_BAR_COUNT:Int = 256;
	static inline var VIZ_BAR_MAX_H:Int = 240;
    
 	public function new()
	{
		super();
		trace("Entering the Login State!");
		trace("What's the password?");
	}

    override public function create():Void {
		LocaleUtils.loadDeviceDateTimeSettings();
        FlxG.sound.playMusic("assets/shared/music/login.ogg", 0.5, true);
        FlxG.camera.flash(VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
        FlxG.mouse.visible = true;
        super.create(); 
		
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Welcome to Vs. WinMario!", null);
		#end
        
        var bg:FlxSprite = new FlxSprite(0, 0);
		if (ClientPrefs.data.pcLight != false) {
        bg.loadGraphic("assets/shared/images/desktop/loginBG.png");
		} else {bg.loadGraphic("assets/shared/images/light-mode/desktop/loginBG.png");
		}
        add(bg);

		if(!VsliceOptions.LOW_QUALITY) {
		var grid:FlxBackdrop = new FlxBackdrop(FlxGridOverlay.createGrid(80, 80, 160, 160, true, 0x33FFFFFF, 0x0));
		grid.velocity.set(40, 40);
		grid.alpha = 0;
		FlxTween.tween(grid, {alpha: 1}, 0.5, {ease: FlxEase.quadOut});
		add(grid);
		
		_vizBars = new FlxTypedGroup<FlxSprite>();
		var vizBarW:Int = Std.int(FlxG.width / VIZ_BAR_COUNT);
		for(i in 0...VIZ_BAR_COUNT) {
			var vbar = new FlxSprite();
			vbar.makeGraphic(vizBarW - 1, VIZ_BAR_MAX_H, 0xFF6A0DAD);
			vbar.setGraphicSize(vizBarW - 1, 2);
			vbar.updateHitbox();
			vbar.x = i * vizBarW;
			vbar.y = FlxG.height - 2;
			vbar.alpha = 0.0;
			vbar.scrollFactor.set();
			_vizBars.add(vbar);
		}
		add(_vizBars);
		_needsAnalyzerInit = true;
	}

		clockText = new FlxText(10, 658, 0, "00:00", 16);
        clockText.setFormat(Paths.font("5by7_b.ttf"), 16);
        add(clockText);

		var now = Date.now();
		var day = now.getDate();
		var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		var monthName = monthNames[now.getMonth()];
		var year = now.getFullYear();

		var dateText = new FlxText(10, 683, 0, monthName + " " + day + ", " + year, 16);
		dateText.setFormat(Paths.font("5by7_b.ttf"), 16);
		add(dateText);

        // Update time every 1 second (1000ms)
        var timer = new Timer(1000);
        timer.run = updateClock;
        
        // Run once immediately
        updateClock();

        var logoBl:FlxSprite;
        logoBl = new FlxSprite(250, -75);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = VsliceOptions.ANTIALIASING;

		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24, false);
        FlxTween.tween(logoBl, {y: logoBl.y + 50}, 0.6, {ease: FlxEase.quadInOut, type: PINGPONG});
		logoBl.animation.play('bump');
		logoBl.updateHitbox();
        add(logoBl);

        //
		password = new FlxText(300, 650, 0, "What's the password? Remember! it's in MMDDYYYY\n          Hint: When was Vs. WinMario Release?", 24);
        password.setFormat(Paths.font("vcr.ttf"), 24);
        add(password);

        button1 = new FlxButton(0, 120, "10292009", nope1);
        add(button1);

        button2 = new FlxButton(0, 160, "8282010", nope1);
        add(button2);

        button3 = new FlxButton(0, 200, "7202025", nope2);
        add(button3);

		button4 = new FlxButton(0, 240, "8142019", nope1);
        add(button4);

        button5 = new FlxButton(0, 280, "8272025", nope3);
        add(button5);

        button6 = new FlxButton(0, 320, "8192025", startGame);
        add(button6);

		button7 = new FlxButton(0, 360, "822021", nope4);
        add(button7);

		button8 = new FlxButton(0, 400, "212021", nope4);
        add(button8);

		button9 = new FlxButton(0, 440, "3162021", nope4);
        add(button9);

		button10 = new FlxButton(1180, 650, "EXIT", exit);
		button10.color = FlxColor.RED;
        button10.label.color = FlxColor.WHITE;
        add(button10);

        #if debug
        testSetup = new FlxButton(0, 0, "ReRun Setup", loadSetup);
        add(testSetup);
        #end

		if (ClientPrefs.data.pcLight == true) {
			dateText.color = FlxColor.BLACK;
			clockText.color = FlxColor.BLACK;
		}
    }

    function startGame():Void {
				button6.color = FlxColor.WHITE;
				button6.alpha = 1;

				if (button6 != null)
					button6.animation.play('flashing');

				FlxG.camera.flash(VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                FlxG.sound.music.fadeOut();

				transitioning = true;
				// FlxG.sound.music.stop();

				enterTimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
                    FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					
					if (ClientPrefs.data.skipLogin != 'Desktop') {
					FlxG.switchState(new DesktopState());
					} else {
					FlxG.mouse.visible = false;
                    FlxG.switchState(new IntroVideoState());
					}

					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}

    function exit():Void {
            openfl.Lib.application.window.close();
    }

    function nope1():Void {
				wrong1 = new FlxText(530, 600, 0, "Do you really think FNF Released\nbefore 2020? Try Again.", 24);
       			wrong1.setFormat(Paths.font("vcr.ttf"), 24);
				wrong1.color = 0xFF0000;
				FlxTween.tween(wrong1, {alpha: 0}, 5);
        		add(wrong1);
			}
	function nope2():Void {
				wrong2 = new FlxText(530, 600, 0, "Try Again.", 24);
       			wrong2.setFormat(Paths.font("vcr.ttf"), 24);
				wrong2.color = 0xFF0000;
				FlxTween.tween(wrong2, {alpha: 0}, 5);
        		add(wrong2);
			}
	function nope3():Void {
				wrong3 = new FlxText(530, 600, 0, "Look at Game Jolt's Page for Release Day. :/", 24);
       			wrong3.setFormat(Paths.font("vcr.ttf"), 24);
				wrong3.color = 0xFF0000;
				FlxTween.tween(wrong3, {alpha: 0}, 5);
        		add(wrong3);
			}
	function nope4():Void {
				wrong4 = new FlxText(530, 600, 0, "The Developer didn't made any\nMods till 2025! Try Again.", 24);
       			wrong4.setFormat(Paths.font("vcr.ttf"), 24);
				wrong4.color = 0xFF0000;
				FlxTween.tween(wrong4, {alpha: 0}, 5);
        		add(wrong4);
			}
    #if debug
    function loadSetup():Void {
				testMobileSetup.color = FlxColor.WHITE;
				testMobileSetup.alpha = 1;

				if (testMobileSetup != null)
					testMobileSetup.animation.play('flashing');

				FlxG.camera.flash(VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                FlxG.sound.music.fadeOut();

				transitioning = true;
				// FlxG.sound.music.stop();

				enterTimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
                    FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.switchState(new LoginStateFlash());

					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}
    #end

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if(_needsAnalyzerInit && FlxG.sound.music != null && FlxG.sound.music.playing) {
			@:privateAccess
			if(FlxG.sound.music._channel != null && FlxG.sound.music._channel.__audioSource != null) {
				// Improved spectral analyzer calibration
				_analyzer = new SpectralAnalyzer(FlxG.sound.music._channel.__audioSource, VIZ_BAR_COUNT, 0.08, 25);
				// Better frequency range for music visualization
				_analyzer.minFreq = 40;
				_analyzer.maxFreq = 18000;
				// Adjust dB range for better sensitivity
				_analyzer.minDb = -80;
				_analyzer.maxDb = -15;
				#if !web
				// Higher FFT size for better frequency resolution
				_analyzer.fftN = 512;
				#end
				_needsAnalyzerInit = false;
			}
		}
		if(_vizBars != null) {
			var vizBarW:Int = Std.int(FlxG.width / VIZ_BAR_COUNT);
			if(_analyzer != null) {
				_analyzerLevels = _analyzer.getLevels(_analyzerLevels);
				for(i in 0..._vizBars.members.length) {
					var vbar = _vizBars.members[i];
					if(vbar == null) continue;
					var level:Float = (i < _analyzerLevels.length) ? _analyzerLevels[i].value : 0.0;
					var h:Int = Std.int(Math.max(2, level * VIZ_BAR_MAX_H));
					vbar.setGraphicSize(vizBarW - 1, h);
					vbar.updateHitbox();
					vbar.x = i * vizBarW;
					vbar.y = FlxG.height - h;
					vbar.alpha = 1.0;
				}
			} else {
				for(i in 0..._vizBars.members.length) {
					var vbar = _vizBars.members[i];
					if(vbar == null) continue;
					vbar.setGraphicSize(vizBarW - 1, 2);
					vbar.updateHitbox();
					vbar.y = FlxG.height - 2;
					vbar.alpha = 1.0;
				}
			}
		}

		if (dateTimeText != null) {
            var now:Date = Date.now();

            dateTimeText.text = LocaleUtils.formatDateTimeAccordingToDevice(now);
        }
	}

	override function destroy():Void {
		_analyzer = null;
		_analyzerLevels = null;
		if(_vizBars != null) { _vizBars.destroy(); _vizBars = null; }
		super.destroy();
	}

	function updateClock():Void {
        // Format: Hour:Minute:Second
        if (ClientPrefs.data.clock == '12 Hour')
        clockText.text = DateTools.format(Date.now(), "%I:%M %p");
        if (ClientPrefs.data.clock == '24 Hour')
        clockText.text = DateTools.format(Date.now(), "%H:%M");
    }
}