local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false

function onStartCountdown()
    if not allowCountdown and isStoryMode and not startedFirstDialogue then
        setProperty('inCutscene', true);
        runTimer('startDialogue', 0.8);
        startedFirstDialogue = true;
        return Function_Stop;
    end

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
        startDialogue('dialogue', 'Special_7');
    elseif tag == 'startDialogueEnd' then
        startDialogue('dialogueEnd', 'Special_7');
    end
end