package states;

import flixel.FlxState;
import sys.FileSystem;

// That way the music will not play
class StopandThink extends FlxState {
    override function create() {
        var filePath:String = "assets/shared/images/desktop/Jerry32.bin";

        #if (desktop || debug)
        if (FileSystem.exists(filePath))
        {
        MusicBeatState.switchState(new LoginState());
        
		if (ClientPrefs.data.skipLogin == 'Login')
		MusicBeatState.switchState(new DesktopState());

        if (ClientPrefs.data.strictLogin == true)
		MusicBeatState.switchState(new LoginStateStrict());
        } else {
            if (ClientPrefs.data.skipLogin != 'Login') {
            MusicBeatState.switchState(new states.errorDektops.OhNoLogin());
            }
            else {
		    MusicBeatState.switchState(new states.errorDektops.OhNoDesktop());
         }
        }

        if (ClientPrefs.data.skipLogin == 'Both')
		MusicBeatState.switchState(new IntroVideoState());

        #elseif mobile
        MusicBeatState.switchState(new IntroVideoState());
        #end

        super.create();
    }
}