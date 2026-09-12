package states.sub;

import flixel.FlxState;

// That way the music will not play
class TitleSub extends FlxState {
    override function create() {
        FlxG.switchState(new IntroVideoState());

        if (ClientPrefs.data.introvideoCutscene == 'Disabled')
            FlxG.switchState(new mikolka.vslice.ui.title.TitleState());

        if (Date.now().getMonth() == 7 && Date.now().getDate() == 28)
				FlxG.switchState(new states.sub.BirthdaySub());

        super.create();
    }
}