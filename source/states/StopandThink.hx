package states;

import flixel.FlxState;

class StopandThink extends FlxState {
    override function create() {

        #if (html5 || web)
		MusicBeatState.switchState(new states.errorDesktops.OhNoHTML5());
        #else
        MusicBeatState.switchState(new IntroVideoState());
        #end

        super.create();
    }
}