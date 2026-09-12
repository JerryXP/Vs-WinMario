package mikolka.vslice.ui.disclaimer;

import flixel.FlxState;

class OutdatedState extends WarningState
{

	public function new(newVersion:String,nextState:FlxState) {
		final bro:String = #if windows 'twin' #elseif mac 'bro' #elseif linux 'dude' #elseif android 'kiddo' #elseif ios 'friend' #else 'Anonymous' #end;
		final escape:String = (controls.mobileC) ? '(B)' : '[ESCAPE]';

		var guh = "Hey "+bro+", Unfounetely, you are using a\n
			Outdated Version of Vs. WinMario, which is (" + MainMenuState.winmarioVersion + ")
			\n Meanwhile, the Current Version is (" + newVersion + ")\n
			Please Update the Version!!!\n
		Press "+escape+" to proceed anyway.\n
		\n
		Thank you!";
		super(guh,() ->{
			CoolUtil.browserLoad("https://gamejolt.com/games/VsWinMario/1009592");
			if(onExit != null) onExit();
		},onExit,nextState);
	}
}
class FlashingState extends WarningState{
	public function new(nextState:FlxState) {

		final enter:String = controls.mobileC ? 'A' : 'ENTER';
		final escape:String = controls.mobileC ? 'B' : 'ESCAPE';
		var text = 	"Hey!\n
			This Mod Contains Flashing Lights.\n
			& Thank you for downloading this mod.\n
			All assets have been used from different mods is not mine.\nAll credits to people who made it.\n
			THIS MOD IS NOT CONNECTED TO PIBBY & CORRUPTION.\n
			If you're here for that, you're in the wrong place.\n
			Anyways... Do you wish to disable flashing lights?\n
			Press " + enter + " to disable them now or go to Options Menu.\n
			Press " + escape + " to ignore this message.\n
			You've been warned!";
		super(text,() ->{
			#if LEGACY_PSYCH
			ClientPrefs.flashing = false;
			#else
			ClientPrefs.data.flashing = false;
			#end
			ClientPrefs.saveSettings();
		},() ->{},nextState);
	}
}