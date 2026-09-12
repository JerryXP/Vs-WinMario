package states.sub;

import flixel.FlxState;

// That way the music will not play
class BirthdaySub extends FlxState {
    override function create() {
        FlxG.switchState(new birthday.IntroVideoState());

        if (ClientPrefs.data.introvideoCutscene == 'Disabled')
            FlxG.switchState(new birthday.TitleState());

        super.create();
    }
}