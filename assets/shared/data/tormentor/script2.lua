local allowCountdown = false
function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('tormentorEnd');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end