local allowCountdown = false
function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('true_ending');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end