package states;

import flixel.ui.FlxButton;
import lime.app.Application;
import backend.LocaleUtils;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
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
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import haxe.Timer;
import DateTools;
import mikolka.compatibility.VsliceOptions;

class LoginState extends FlxState {
    private var enterButton:FlxButton;
    private var exitButton:FlxButton;
    private var quickMenuButton:FlxButton;
	private var bugButton:FlxButton;
    #if debug
    private var testSetup:FlxButton;
    private var testMobileSetup:FlxButton;
    #end
	var clockText:FlxText;

	private var popOK:FlxButton;
	private var popX:FlxButton;

	var infoBox:FlxSprite = new FlxSprite(0, 0);
    
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
        if (ClientPrefs.data.pcLight != true) {
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
        enterButton = new FlxButton(360, 611, "", startGame);
        enterButton.loadGraphic("assets/shared/images/desktop/enter_icon-title.png");
        add(enterButton);
        add(enterButton);

        exitButton = new FlxButton(520, 611, "", exit);
        exitButton.loadGraphic("assets/shared/images/desktop/exit_icon-title.png");
        add(exitButton);
        add(exitButton);

        quickMenuButton = new FlxButton(680, 611, "", openPreMenu); 
        quickMenuButton.loadGraphic("assets/shared/images/desktop/menu_icon-title.png");
        add(quickMenuButton);
        add(quickMenuButton);

		bugButton = new FlxButton(840, 611, "", openForm); 
        bugButton.loadGraphic("assets/shared/images/desktop/bug_icon-title.png");
        add(bugButton);
        add(bugButton);

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
				enterButton.color = FlxColor.WHITE;
				enterButton.alpha = 1;

				if (enterButton != null)
					enterButton.animation.play('flashing');

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
            enterButton.color = FlxColor.WHITE;
				enterButton.alpha = 1;

				if (enterButton != null)
					enterButton.animation.play('flashing');

				FlxG.camera.flash(VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                FlxG.sound.music.fadeOut();

				transitioning = true;
				// FlxG.sound.music.stop();

				enterTimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
                    FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					MusicBeatState.switchState(new OutroGameState());

					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}

	function openForm():Void {
            CoolUtil.browserLoad('https://github.com/JerryXP/WinMarioFNF-2026-BUG-REPORTS-/issues');
    }

	function openPreMenu():Void {
            infoBox.loadGraphic("assets/shared/images/desktop/pop-up/quick-menu.png"); // Use AssetPaths or a raw string "assets/images/player.png"
            infoBox.screenCenter();
            add(infoBox);

			popOK = new FlxButton(690, 400, "Yes", openMenu);
            add(popOK);

			popX = new FlxButton(600, 400, "No", closeTheTab);
            add(popX);
    }

	function closeTheTab():Void {
            remove(popOK);
			remove(popX);
            remove(infoBox);
    }

    function openMenu():Void {
			remove(popOK);
			remove(popX);
            remove(infoBox);
				enterButton.color = FlxColor.WHITE;
				enterButton.alpha = 1;

				if (enterButton != null)
					enterButton.animation.play('flashing');

				FlxG.camera.flash(VsliceOptions.FLASHBANG ? FlxColor.WHITE : 0x4CFFFFFF, 1);
				FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                FlxG.sound.music.fadeOut();

				transitioning = true;
				// FlxG.sound.music.stop();

				enterTimer = new FlxTimer().start(1, function(tmr:FlxTimer)
				{
                    FlxTransitionableState.skipNextTransIn = true;
					FlxTransitionableState.skipNextTransOut = true;
					FlxG.mouse.visible = false;
					FlxG.switchState(new options.QuickMenu());

					closedState = true;
				});
				// FlxG.sound.play(Paths.music('titleShoot'), 0.7);
			}
    #if debug
    function loadSetup():Void {
				testSetup.color = FlxColor.WHITE;
				testSetup.alpha = 1;

				if (testSetup != null)
					testSetup.animation.play('flashing');

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
	}

	function updateClock():Void {
        // Format: Hour:Minute:Second
        if (ClientPrefs.data.clock == '12 Hour')
        clockText.text = DateTools.format(Date.now(), "%I:%M %p");
        if (ClientPrefs.data.clock == '24 Hour')
        clockText.text = DateTools.format(Date.now(), "%H:%M");
    }

	override function destroy():Void {
		_analyzer = null;
		_analyzerLevels = null;
		if(_vizBars != null) { _vizBars.destroy(); _vizBars = null; }
		super.destroy();
	}
}