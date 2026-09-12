function onEndSong()
	if not allowEnd and not seenCutscene and isStoryMode then
		if difficultyName == 'Easy' then
			startDialogue('dialogueEnd-Easy', 'Week1');
		elseif difficultyName == 'Normal' then
			startDialogue('dialogueEnd-Normal', 'Week1');
		elseif difficultyName == 'Hard' then
			startDialogue('dialogueEnd-Hard', 'Week1');
		elseif difficultyName == 'Insane' then
			startDialogue('dialogueEnd-Insane', 'Week1');	
		end
		allowEnd = true;
		return Function_Stop
	end
	return Function_Continue
end