package states;

import flixel.FlxSubState;

import flixel.effects.FlxFlicker;
import lime.app.Application;
import mikolka.vslice.ui.MainMenuState;
import Date;

class InfoDesktop extends MusicBeatState
{
	public static var leftState:Bool = false;

	var isYes:Bool = true;
	var texts:FlxTypedSpriteGroup<FlxText>;
	var bg:FlxSprite;

	override function create()
	{
		super.create();

		FlxG.mouse.visible = false;

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		texts = new FlxTypedSpriteGroup<FlxText>();
		texts.alpha = 0.0;
		add(texts);

		var warnText:FlxText = new FlxText(0, 0, FlxG.width,
			"Information\n\n
			WinMario " + MainMenuState.winmarioVersion + "\n
			======\n
			Psych Engine: v" + MainMenuState.psychEngineVersion + "\n
			P-Slice: v" + MainMenuState.pSliceVersion + "\n
			FNF Emulator Based: " + MainMenuState.funkinVersion + "\n
			======\n"
			+ #if windows "OS: Windows\n" #elseif mac "OS: MacOS\n" #elseif linux "OS: Linux\n" #elseif html5 "OS: HTML5 *pirate*\n" #elseif android "OS: Android (you're not supposed to be here)\n" #elseif ios "OS: iOS (you're not supposed to be here)\n" #else "OS: Unknown\n" #end
			+ "WM/LXP Team | (C)2025-2026\n");
		warnText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		texts.add(warnText);

		final keys = [#if desktop "Press [ENTER] to exit" #else "" #end];
		for (i in 0...keys.length) {
			final button = new FlxText(0, 0, FlxG.width, keys[i]);
			button.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER);
			button.y = (warnText.y + warnText.height) + 24;
			button.x += (128 * i) - 0;
			texts.add(button);
		}

		FlxTween.tween(texts, {alpha: 1.0}, 0.5, {
			onComplete: (_) -> updateItems()
		});
	}

	override function update(elapsed:Float)
	{
		if(leftState) {
			super.update(elapsed);
			return;
		}
		var back:Bool = controls.BACK;
		if (controls.UI_LEFT_P || controls.UI_RIGHT_P) {
			FlxG.sound.play(Paths.sound("scrollMenu"), 0.7);
			isYes = !isYes;
			updateItems();
		}
		if (controls.ACCEPT) {
				FlxG.sound.play(Paths.sound('confirmMenu'));
				FlxTween.tween(texts, {alpha: 0}, 1, {
					onComplete: (_) -> MusicBeatState.switchState(new DesktopState())
				});
		}
		super.update(elapsed);
	}

	function updateItems() {
		// it's clunky but it works.
		texts.members[1].alpha = isYes ? 1.0 : 0.6;
	}
}
