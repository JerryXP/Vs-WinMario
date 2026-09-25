package birthday;

import flixel.util.typeLimit.OneOfTwo;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.Assets;
import haxe.xml.Access;
#if hxvlc
import hxvlc.flixel.FlxVideoSprite;
#end

class IntroVideoState extends MusicBeatState
{
	var allowMouse:Bool = false;
	var currentFPS:Bool = false;

	#if VIDEOS_ALLOWED
	public var videoCutscene:FlxVideoSprite;
	override public function create():Void
	{
			if (ClientPrefs.data.introvideoCutscene == 'WinZinc')
        	startVideo('winZinc'); // change this boi
			if (ClientPrefs.data.introvideoCutscene == 'Win14')
			startVideo('win14');
			if (ClientPrefs.data.introvideoCutscene == 'Win16')
			startVideo('win16');
			if (ClientPrefs.data.introvideoCutscene == 'Win18')
			startVideo('win18');
			if (ClientPrefs.data.introvideoCutscene == 'WinVista')
			startVideo('winVista');

		super.create();
	}

   	public function startVideo(name:String)
	{
		videoCutscene = new FlxVideoSprite(0, 0);
		add(videoCutscene);
		videoCutscene.load(Paths.video("intro/"+(name)));
		videoCutscene.play();
		videoCutscene.alpha = 1;
		videoCutscene.visible = true;
		videoCutscene.bitmap.onEndReached.add(function()
		{
            		new FlxTimer().start(0.1, function(tmr:FlxTimer)
            		{
				MusicBeatState.switchState(new birthday.TitleState());
            		});
		});
	}
	
	override public function update(elapsed:Float):Void
	{
		#if desktop
		if (controls.ACCEPT)
			MusicBeatState.switchState(new birthday.TitleState());
		#end
		#if mobile
		if (TouchUtil.justReleased && !SwipeUtil.swipeAny)
			MusicBeatState.switchState(new birthday.TitleState());
		#end
		if (ClientPrefs.data.introvideoCutscene == 'Disabled')
        	MusicBeatState.switchState(new birthday.TitleState());
		super.update(elapsed);
	}
	#end
}