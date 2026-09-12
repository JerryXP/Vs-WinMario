-- time bar changes colours every note hit cool epic, by HavenMari
-- omly player

function onSongStart()
	if colorNoteTime then
		setProperty("timeBar.leftBar.color",getColorFromHex("000fff"))
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if colorNoteTime then
		if noteData == 0 then
			setProperty("timeBar.leftBar.color",getColorFromHex("E200ff"))
		end

		if noteData == 1 then
			setProperty("timeBar.leftBar.color",getColorFromHex("00ddff"))
		end

		if noteData == 2 then
			setProperty("timeBar.leftBar.color",getColorFromHex("06ff00"))
		end

		if noteData == 3 then
			setProperty("timeBar.leftBar.color",getColorFromHex("Ff0004"))
		end
	end
end