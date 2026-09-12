allowcoutn = false

function onStartCountdown() -- delete space between on Start
	if not allowcoutn then
		setProperty('inCutscene', true);
		startDialogue('dialogue', ' ')
		playMusic('pre-week14/Part2', 0, true)
		allowcoutn = true

		return Function_Stop;
	end
	return Function_Contiue;
end