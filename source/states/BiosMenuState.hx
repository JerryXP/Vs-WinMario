package states;

import flixel.addons.display.FlxGridOverlay;
import flixel.addons.display.FlxBackdrop;
import flixel.*;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
#if sys
import sys.FileSystem;
#end
import flixel.addons.ui.FlxInputText;

class BiosMenuState extends MusicBeatState {
	
	var bg:FlxSprite;
	var background:FlxSprite;
    var imageSprite:FlxSprite;
	
    var imagePath:Array<String>;
    var charDesc:Array<String>;
    var charName:Array<String>;
	var bgColors:Array<String>;

	var curSelected:Int = -1;
    var currentIndex:Int = 0;

    var descriptionText:FlxText;
    var characterName:FlxText;

	override function create() {
		
		FlxG.mouse.visible = false;

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Bios Menu", null);
		#end

		
		background = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
        background.setGraphicSize(Std.int(background.width * 1.2));
		background.color = 0xFFFF00C0;
        background.screenCenter();
        add(background);

		// i took this from psych's engine code lol
		var grid:FlxBackdrop = new FlxBackdrop(FlxGridOverlay.createGrid(80, 80, 160, 160, true, 0x33000000, 0x0));
		grid.velocity.set(30, 30);
		grid.alpha = 0;
		FlxTween.tween(grid, {alpha: 1}, 0.5, {ease: FlxEase.quadOut});
		add(grid);

		// EDIT YOU IMAGES HERE / DONT FORGET TO CREATE A FOLDER IN images CALLED bios IT SHOULD LOOK LIKE THIS 'images/bios'
		// REMINDER!!! THE IMAGES MUST BE 518x544, IF NOT, THEY WONT FIT ON THE SCREEN!!


		imagePath = [
		// INTRODUCTION
		"bios/sample",
		// VS. WINMARIO
		"bios/WinMario", // WinMario
		"bios/MacOS Wario", // MacOS Wario
		"bios/MacOS Wario (evil)", // MacOS Wario (evil)
		"bios/99", // Mr. Glitch/99
		"bios/Evan", // DinoEvan
		"bios/Paula", // Paula (aka PxJx or Paxton)
		// FNF
		"bios/Boyfriend", // BF/Boyfriend
		"bios/Girlfriend", // GF/Girlfriend
		"bios/Pico", // Pico
		"bios/Nene", // Nene
		"bios/Spookeez", // Skid & Pump
		"bios/Lemon Demon", // Lemon Demon/Monster
		"bios/Glitch Retards", // Mr. Glitch's Minions
		"bios/99's Son", // Mr. Glitch's "Son"
		// Specials or Misc.
		"bios/Mario", // Mario
		"bios/Luigi", // Luigi
		"bios/Baldi", // Baldi
		"bios/Sonic", // Sonic
		];

		// DESCRIPTION HERE

        charDesc = [
		// INTRODUCTION
		"Hi! This is a Bios State\nThis is where you can see the info\nof the characters.\n\nPress [UP] or [DOWN] to see the\ninfo of the characters.",
		// VS. WINMARIO
		"Born: August 28, 2010\nGender: Male\nOccupation: Gaming, Coding, &\nWorks on Videos\nType: Protagonist", // WinMario
		"Born: August 28, 2010\nGender: Male\nOccupation: Working & Pray to God\nType: Tetratagonist", // MacOS Wario
		"\n\nBorn: January 1, 2025\nGender: Male\nOccupation: Working for Mr. Glitch,\n& Tormenting His Normal Version\nDied: December 24, 2025\nCause of Death: Removed by\nhis normal clone.\nType: Antagonist", // MacOS Wario (evil)
		"Born: [REDACTED]\nAge: None\nGender: Male\nOccupation: Turning Normal People to\nGlitch\nDied: January 2, 2026\nCause of Death: USB Killer\n& His Laptop Destroyed\nType: Antagonist", // Mr. Glitch/99
		"Born: May 28, 2010\nGender: Male\nOccupation: Works on Videos\n& Taking care of Rio, Elena, & other\nDinosaur People.\nType: Deuteragonist", // DinoEvan
		"Born: February 15, 2011\nGender: Female\nOccupation: Artist\nType: Tritagonist", // Paula (aka PxJx or Paxton)
		// FNF
		"Born: Undetermined\nAge: 19\nGender: Male\nOccupation: Singer\nType: Tritagonist", // BF/Boyfriend
		"Born: Undetermined\nAge: 19\nGender: Female\nOccupation: Artist\nType: Tritagonist", // GF/Girlfriend
		"Born: Undetermined\nAge: 19\nGender: Male\nOccupation: Contract Killer\nType: Pentagonist & Neutral", // Pico
		"Born: Undetermined\nAge: 19\nGender: Female\nOccupation: Contract Killer\n& Employee at her family's\nstore (possibly)\nType: Pentagonist & Neutral\n", // Nene
		"Born: Both Undetermined\nAge: 8 (Skid) & 7 (Pump)\nGender: Both Male\nOccupation: None\nType: Both Neutral", // Skid & Pump
		"\n\nBorn: Unknown\nGender: Male\nOccupation: None\nType: Neutral & Antagonist", // Lemon Demon/Monster
		"Born: October 2025\nGender: Male (Glitched Pico, BF, &\nWinMario)\n& Female (Glitched GF)\nOccupation: Working for Mr. Glitch\nDied: January 1, 2026\nCause of Death:\nSent to Hell (Glitched GF)\nShot (Glitched Pico)\nHit by Mic (Glitched BF)\nOverheated (Glitched WinMario)\nType: All Antagonist", // Mr. Glitch's Minions
		"\n\nBorn: January 1, 2026\nGender: Male\nOccupation: Working for his Father\nDied: January 2, 2026\nCause of Death: Self Destruct\nType: Antagonist", // Mr. Glitch's "Son"
		// Specials or Misc.
		"Born: October 11\nAge: 24-26\nGender: Male\nOccupation: Plumber, Saving People,\n& Adventurer\nType: Tritagonist & Tetartagonist", // Mario
		"Born: Undetermined\nAge: Mid-20s\nGender: Male\nOccupation: Plumber, Saving People,\n& Adventurer\nType: Tritagonist", // Luigi
		"Born: 1970\nAge: 29\nGender: Male\nOccupation: Teacher\nType: Neutral & Antagonist", // Baldi
		"Born: June 23 (?)\nAge: 15-16\nGender: Male\nOccupation: Saving Animals/People &\nAdventurer\nType: Pentagonist", // Sonic
		];

		// NAME HERE

        charName = [ 
		// INTRODUCTION
		"Hi!",
		// VS. WINMARIO
		"WM/LXP", // WinMario
		"MacOS Wario", // MacOS Wario
		"MacOS Wario\n(evil)", // MacOS Wario (evil)
		"Mr. Glitch", // Mr. Glitch/99
		"DinoEvan.21", // DinoEvan
		"Paula", // Paula (aka PxJx or Paxton)
		// FNF
		"Boyfriend", // BF/Boyfriend
		"Girlfriend", // GF/Girlfriend
		"Pico", // Pico
		"Nene", // Nene
		"Skid & Pump", // Skid & Pump
		"Lemon\nDemon", // Skid & Pump
		"Glitch Idiots", // Lemon Demon/Monster
		"Mr. Glitch's\n\"Son\"", // Mr. Glitch's "Son"
		// Specials or Misc.
		"Mario", // Mario
		"Luigi", // Luigi
		"Baldi", // Luigi
		"Sonic", // Sonic
		];


		// SET UP THE FIRST IMAGE YOU WANT TO SEE WHEN ENTERING THE MENU
		imageSprite = new FlxSprite(55, 99).loadGraphic(Paths.image("bios/sample"));
        add(imageSprite);

		characterName = new FlxText(630, 94, charName[currentIndex]);
        characterName.setFormat(Paths.font("vcr.ttf"), 96, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		characterName.antialiasing = true;
		characterName.borderSize = 4;
        add(characterName);

		descriptionText = new FlxText(630, 247, charDesc[currentIndex]);
        descriptionText.setFormat(Paths.font("vcr.ttf"), 34, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descriptionText.antialiasing = true;
		descriptionText.borderSize = 2.5;
        add(descriptionText);

		var arrows = new FlxSprite(218, 26).loadGraphic(Paths.image('bios/assets/biosThing'));
		add(arrows);

		super.create();
	}

	override function update(elapsed:Float) {
		
		if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W) 
			{
				currentIndex--;
				if (currentIndex < 0)
				{
					currentIndex = imagePath.length - 1;
				}
				remove(imageSprite);
				imageSprite = new FlxSprite(55, 99).loadGraphic(Paths.image(imagePath[currentIndex]));
				add(imageSprite);
				descriptionText.text = charDesc[currentIndex];
				characterName.text = charName[currentIndex];
				FlxG.sound.play(Paths.sound('scrollMenu'));  
	
			}
			else if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S)
			{
				currentIndex++;
				if (currentIndex >= imagePath.length)
				{
					currentIndex = 0;
				}
				remove(imageSprite);
				imageSprite = new FlxSprite(55, 99).loadGraphic(Paths.image(imagePath[currentIndex]));
				add(imageSprite);
				descriptionText.text = charDesc[currentIndex];
				characterName.text = charName[currentIndex];  
				FlxG.sound.play(Paths.sound('scrollMenu'));    
		
			}
			if (controls.BACK)
				{
					FlxG.sound.play(Paths.sound('cancelMenu'));
					MusicBeatState.switchState(new DesktopState());
				}
		
		super.update(elapsed);
	}
}