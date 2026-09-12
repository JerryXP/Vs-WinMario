local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false

function onStartCountdown()
    if not allowCountdown and isStoryMode and not startedFirstDialogue then
        makeLuaSprite('dialoguebg', 'empty', -650, 0);
        setProperty('inCutscene', true);
        runTimer('startDialogue', 0.8);
        addLuaSprite('dialoguebg', true);
        startedFirstDialogue = true;
        return Function_Stop;
    end
    removeLuaSprite('dialoguebg', true);
    return Function_Continue;
end

function onEndSong()
    if not allowCountdown and isStoryMode and not startedEndDialogue then
        setProperty('inCutscene', true);
        runTimer('startDialogueEnd', 0.8);
        startedEndDialogue = true;
        return Function_Stop;
    end

    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then
        startDialogue('dialogue', 'week13/IsolationWinMario');
    elseif tag == 'startDialogueEnd' then
        startDialogue('dialogueEnd', 'week13/Dejection');
    end
end

function onNextDialogue(line)
    if not allowCountdown and isStoryMode and not startedEndDialogue then
	
    if line == 7 then
		soundFadeOut('', 1, 0)
	end

	if line == 8 then
		playMusic('Week1', 0, true)
		soundFadeIn('', 1, 0, 1)
	end

    if line == 16 then
		soundFadeOut('', 1, 0)
	end

    if line == 28 then
		playMusic('week13/Danger', 0, true)
		soundFadeIn('', 1, 0, 1)
	end

    if line == 43 then
		soundFadeOut('', 1, 0)
	end

    if line == 45 then
		playMusic('week13/Dejection', 0, true)
		soundFadeIn('', 1, 0, 1)
	end

    startedFirstDialogue = true;
    return Function_Stop;
    end
    return Function_Continue;
end