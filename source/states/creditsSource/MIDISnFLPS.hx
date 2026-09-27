package states.creditsSource;

import mikolka.funkin.custom.mobile.MobileScaleMode;
import objects.AttachedSprite;

class MIDISnFLPS extends MusicBeatState
{
	var curSelected:Int = -1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Array<String>> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:FlxColor;
	var descBox:AttachedSprite;

	var offsetThing:Float = -75;

	override function create()
	{
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		persistentUpdate = true;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);
		
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		var defaultList:Array<Array<String>> = [ //Name - Icon name - Description - Link - BG Color.
			["Week 1"],
			["philip_pines4",		        "missing_icon",		        "Opheebop",					       "https://onlinesequencer.net/members/68187",	"808080"],
			["PhuTHGamer",		        "missing_icon",		        "R.A.M.",					       "https://gamebanana.com/members/2453340",	"808080"],
			["StuffYT",		        "missing_icon",		        "Cob",					       "https://onlinesequencer.net/members/69897",	"808080"],
			[""],
			["Week 2"],
			["LTHS02",		        "missing_icon",		        "Blue Balled (edit by me)",					       "https://gamebanana.com/members/2086713",	"808080"],
			["BESTARTY",		        "missing_icon",		        "Terminal",					       "https://www.youtube.com/@bestarty999",	"808080"],
			["Dibujos Creativos Extra",		        "missing_icon",		        "Ejected",					       "",	"808080"],
			[""],
			["Week 3"],
			["PhuTHGamer",		        "missing_icon",		        "Hello World!",			"https://gamebanana.com/members/2453340",	"808080"],
			["PhuTHGamer",		        "missing_icon",		        "Java",					       "https://gamebanana.com/members/2453340",	"808080"],
			["PhuTHGamer",		        "missing_icon",		        "LCD",					       "https://gamebanana.com/members/2453340",	"808080"],
			[""],
			["Week 4"],
			["unknown",		        "missing_icon",		        "B-Side South",			"",	"808080"],
			["GrimTKH",		        "missing_icon",		        "Shiver",					       "https://onlinesequencer.net/members/66131",	"808080"],
			["Control&Chaos",		        "missing_icon",		        "Chiller",					"https://www.youtube.com/@Control_Chaos",	"808080"],
			[""],
			["Week 5"],
			["Plucks_Dany",		        "missing_icon",		        "Feliz",			"https://www.youtube.com/@Plucks_D4ny",	"808080"],
			["Triazyze",		        "missing_icon",		        "B-Side Eggnog",					       "https://www.youtube.com/@Yze3",	"808080"],
			[""],
			["Week 6"],
			["Gman963",		        "missing_icon",		        "Phantasm",			"https://www.instagram.com/Gman9630/",	"808080"],
			["Penguin 123-452",		        "missing_icon",		"Confronting Yourself",					  "https://www.youtube.com/@Penguin123452a",	"808080"],
			["PhuTHGamer",		        "missing_icon",		        "Glitcher",			"https://gamebanana.com/members/2453340",	"808080"],
			["PhuTHGamer",		        "missing_icon",		        "Detected",					       "https://gamebanana.com/members/2453340",	"808080"],
			[""],
			["Week 7"],
			["Smuko",		        "missing_icon",		        "Danger",			"https://gamebanana.com/members/1775622",	"808080"],
			["unknown",		        "missing_icon",		"Defeat",					  "",	"808080"],
			["Skye",		        "missing_icon",		        "Finale",			"https://www.youtube.com/@skyewithane__",	"808080"],
			[""],
			["Week 8"],
			["DarthPaulRen",		        "missing_icon",		        "Sunsets",			"https://www.youtube.com/@darthpaulren",	"808080"],
			["BDJ",		        "missing_icon",		"Galactic",					  "https://www.youtube.com/@BambiTGA",	"808080"],
			[""],
			["Week 9"],
			["Luminator",		        "missing_icon",		     "Star Festival",			"https://www.youtube.com/@Luminator",			"808080"],
			["Fujiwara Zach Watterson",		        "missing_icon",		 "Weightless",   "https://www.youtube.com/@ZachFujiwara",	"808080"],
			["Fujiwara Zach Watterson",		        "missing_icon",		 "Stardust",   "https://www.youtube.com/@ZachFujiwara",	"808080"],
			[""],
			["Week 10"],
			["Nafri",		        "missing_icon",		 "Disability",   "https://www.youtube.com/@Nafri4166",	"808080"],
			["WhoIsTimothy",		        "missing_icon",		"Blammed (edit by me)",		"https://www.youtube.com/@wtfistimothy",	"808080"],
			["PhuTHGamer",		        "missing_icon",		        "Hungry (HQ)",					       "https://gamebanana.com/members/2453340",	"808080"],
			[""],
			["Week 11"],
			["TurnipWxlfie",		        "missing_icon",		 "Carefree",   "https://gamebanana.com/members/3558610",	"808080"],
			["DanthUltima",		        "missing_icon",		"High Erect",		"https://www.youtube.com/@DanthUltima",	"808080"],
			["PhuTHGamer",		        "missing_icon",		        "Boogie",					       "https://gamebanana.com/members/2453340",	"808080"],
			[""],
			["Week 12"],
			["WeedLord The Monika Simp",		        "missing_icon",		 "Lo-Fight",   "https://www.youtube.com/@WeedLordTheMonikaSimp",	"808080"],
			["WeedLord The Monika Simp",		        "missing_icon",		 "Godrays",   "https://www.youtube.com/@WeedLordTheMonikaSimp",	"808080"],
			["FriskyWasTaken",		        "missing_icon",		        "Double Kill",		"https://www.youtube.com/@friskywastaken",	"808080"],
			[""],
			["Week 13"],
			["Lincolnjohn1111",		        "missing_icon",		 "Dejection",   "https://www.youtube.com/@lincolnjohn1111",	"808080"],
			["Ghost2811277",		        "missing_icon",		 "Defeat B-Side",   "https://gamebanana.com/members/2811277",	"808080"],
			["Nafri",		        "missing_icon",		        "Angered Him",		"https://www.youtube.com/@Nafri4166",	"808080"],
			["Lincolnjohn1111",		        "missing_icon",		        "Unknown Suffering",		"https://www.youtube.com/@lincolnjohn1111",	"808080"],
			[""],
			["Week 14"],
			["Fujiwara Zach Watterson",		        "missing_icon",		 "My Battle",   "https://www.youtube.com/@ZachFujiwara",	"808080"],
			["DerekNotEric",		        "missing_icon",		 "Whitroll (edit by someone)",   "https://onlinesequencer.net/members/41200",	"808080"],
			["unknown",		        "missing_icon",		        "Careless",		"",	"808080"],
			[""],
			["Week 15"],
			["serenamakescovers",		        "missing_icon",		 "Trouble",   "https://onlinesequencer.net/members/63884",	"808080"],
			["veloci",		        "missing_icon",		 "Onslaught",   "https://gamebanana.com/members/2890077",	"808080"],
			["Ivory muse1",		        "missing_icon",		        "You Can't Run",		"https://www.youtube.com/@ivorymuse12",	"808080"],
			["unknown",		        "missing_icon",		 "Deathmatch",   "",	"808080"],
			["serenamakescovers",		        "missing_icon",		 "Tormentor",   "https://onlinesequencer.net/members/63884",	"808080"],
			["unknown",		        "missing_icon",		        "Remembrance (Final Mix)",		"",	"808080"],
			[""],
			["Week 16"],
			["Flipworksinstuff",		        "missing_icon",		 "Best Girl",   "https://www.youtube.com/@flipworksinstuff9594",	"808080"],
			["JanreyGameFNF",		        "missing_icon",		 "M.I.L.F.",   "https://gamebanana.com/members/2541758",	"808080"],
			[""],
			["Bonus"],
			["unknown",		        "missing_icon",		 "Neo Bopeebo",   "",	"808080"],
			["SPIKE Funkin",		        "missing_icon",		 "Reactor",   "",	"808080"],
			["Digital Hourglass",		        "digi",		     "Barrel Roll\n(hint for flp: it's in his Discord Server)",		"https://www.youtube.com/@DigitalHourglass",   "0000FF"],
			["Savestate Corrupted",		        "missing_icon",		 "Cinnamon",   "https://gamebanana.com/members/1914394",	"808080"],
			["Plucks_Dany",		        "missing_icon",		        "Hark",			"https://www.youtube.com/@Plucks_D4ny",	"808080"],
			["Katorrox",		        "missing_icon",		 "Glitcher Remix",   "https://www.youtube.com/@Katorroxx_",	"808080"],
			["EthanTheDoodler",		        "missing_icon",		 "Sabotage",   "https://x.com/D00dlerEthan",	"808080"],
			["unknown",		        "missing_icon",		 "Withered",   "",	"808080"],
			[""],
			["Secret"],
			["ZerWhit",		        "missing_icon",		 "Meltdown",   "https://gamebanana.com/members/2191699",	"808080"],
			["ElverGalarga",		        "missing_icon",		 "Oversight",   "https://onlinesequencer.net/members/106490",	"808080"],
			["FriskyWasTaken",		        "missing_icon",		        "Stargazer",		"https://gamebanana.com/members/1793704",	"808080"],
			["Nafri",		        "missing_icon",		 "Sugar Rush",   "https://www.youtube.com/@Nafri4166",	"808080"],
			["Psion3",		        "missing_icon",		 "Salty's Love",   "https://gamebanana.com/members/3531946",	"808080"],
			["Fujiwara Zach Watterson",		        "missing_icon",		 "Cooling",   "https://gamebanana.com/members/1977810",	"808080"],
			["unknown",		        "missing_icon",		 "Roots",   "",	"808080"],
			["ACMD",		        "missing_icon",		 "Twiddlefinger",   "https://gamebanana.com/members/2069195",	"808080"]
		];
		
		for(i in defaultList)
			creditsStuff.push(i);
	
		for (i => credit in creditsStuff)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(FlxG.width / 2, 300, credit[0], !isSelectable);
			optionText.isMenuItem = true;
			optionText.targetY = i;
			optionText.changeX = false;
			optionText.snapToPosition();
			grpOptions.add(optionText);

			if(isSelectable)
			{
				var str:String = 'credits/missing_icon';
				if(credit[1] != null && credit[1].length > 0)
				{
					var fileName = 'credits/' + credit[1];
					if (Paths.fileExists('images/$fileName.png', IMAGE)) str = fileName;
					else if (Paths.fileExists('images/$fileName-pixel.png', IMAGE)) str = fileName + '-pixel';
				}

				var icon:AttachedSprite = new AttachedSprite(str);
				if(str.endsWith('-pixel')) icon.antialiasing = false;
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);

				if(curSelected == -1) curSelected = i;
			}
			else optionText.alignment = CENTERED;
		}
		
		descBox = new AttachedSprite();
		descBox.makeGraphic(1, 1, FlxColor.BLACK);
		descBox.xAdd = -10;
		descBox.yAdd = -10;
		descBox.alphaMult = 0.6;
		descBox.alpha = 0.6;
		add(descBox);

		var txtWidthOffset:Float = Math.max(MobileScaleMode.gameCutoutSize.x / 2,50);

		descText = new FlxText(txtWidthOffset, FlxG.height + offsetThing - 25, FlxG.width-(txtWidthOffset*2), "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER/*, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK*/);
		descText.scrollFactor.set();
		//descText.borderSize = 2.4;
		descBox.sprTracker = descText;
		add(descText);

		bg.color = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		intendedColor = bg.color;
		changeSelection();
		#if TOUCH_CONTROLS_ALLOWED
		addTouchPad('UP_DOWN', 'A_B');
		#end
		super.create();
	}

	var quitting:Bool = false;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if(!quitting)
		{
			if(creditsStuff.length > 1)
			{
				var shiftMult:Int = 1;
				if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

				var upP = controls.UI_UP_P;
				var downP = controls.UI_DOWN_P;

				if (upP)
				{
					changeSelection(-shiftMult);
					holdTime = 0;
				}
				if (downP)
				{
					changeSelection(shiftMult);
					holdTime = 0;
				}

				if(controls.UI_DOWN || controls.UI_UP)
				{
					var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
					holdTime += elapsed;
					var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

					if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
					{
						changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					}
				}
			}

			if(controls.ACCEPT && (creditsStuff[curSelected][3] == null || creditsStuff[curSelected][3].length > 4)) {
				CoolUtil.browserLoad(creditsStuff[curSelected][3]);
			}
			if (controls.BACK)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new options.CreditsChoice());
				if (Date.now().getMonth() == 7 && Date.now().getDate() == 28)
				MusicBeatState.switchState(new birthday.CreditsChoice());
				quitting = true;
			}
		}
		
		for (item in grpOptions.members)
		{
			if(!item.bold)
			{
				var lerpVal:Float = Math.exp(-elapsed * 12);
				if(item.targetY == 0)
				{
					var lastX:Float = item.x;
					item.screenCenter(X);
					item.x = FlxMath.lerp(item.x - 70, lastX, lerpVal);
				}
				else
				{
					item.x = FlxMath.lerp(200 + -40 * Math.abs(item.targetY), item.x, lerpVal);
				}
			}
		}
		super.update(elapsed);
	}

	var moveTween:FlxTween = null;
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do
		{
			curSelected = FlxMath.wrap(curSelected + change, 0, creditsStuff.length - 1);
		}
		while(unselectableCheck(curSelected));

		var newColor:FlxColor = CoolUtil.colorFromString(creditsStuff[curSelected][4]);
		//trace('The BG color is: $newColor');
		if(newColor != intendedColor)
		{
			intendedColor = newColor;
			FlxTween.cancelTweensOf(bg);
			FlxTween.color(bg, 1, bg.color, intendedColor);
		}

		for (num => item in grpOptions.members)
		{
			item.targetY = num - curSelected;
			if(!unselectableCheck(num)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}

		descText.text = creditsStuff[curSelected][2];
		if(descText.text.trim().length > 0)
		{
			descText.visible = descBox.visible = true;
			descText.y = FlxG.height - descText.height + offsetThing - 60;
	
			if(moveTween != null) moveTween.cancel();
			moveTween = FlxTween.tween(descText, {y : descText.y + 75}, 0.25, {ease: FlxEase.sineOut});
	
			descBox.setGraphicSize(Std.int(descText.width + 20), Std.int(descText.height + 25));
			descBox.updateHitbox();
			
		}
		else descText.visible = descBox.visible = false;
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
