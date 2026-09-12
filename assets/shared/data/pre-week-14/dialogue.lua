allowcoutn = false

function onStartCountdown() -- delete space between on Start
	if not allowcoutn then
		setProperty('inCutscene', true);
		startDialogue('dialogue', ' ')
		playMusic('pre-week14/Part1', 0, true)
		allowcoutn = true

		return Function_Stop;
	end
	return Function_Contiue;
end

function onNextDialogue(line)
	if line == 9 then
		soundFadeOut('', 1, 0)
	end

	if line == 10 then
		playMusic('pre-week14/Part2', 0, true)
		soundFadeIn('', 1, 0, 1)
	end

    if line == 16 then
		playMusic('Special_4', 0, true)
		soundFadeIn('', 1, 0, 1)
	end

    if line == 20 then
		soundFadeOut('', 1, 0)
	end
end