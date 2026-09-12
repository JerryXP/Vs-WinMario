local allowCountdown = false
function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('special7End');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end