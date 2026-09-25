skin = 0
selectcharacters = {'bf', 'pico-playable', 'tankman-playable'
, 'WINDOWS-player', 'PJ-player', 'Dino-player'} -- make it an array, to make it easier to add a character

init = false -- to make sure the initial change char doesn't fuck things up

function onCreatePost()

	initSaveData('selectskins')
	selectcharacters = getDataFromSave('selectskins', 'skinlist')
	skin = getDataFromSave('selectskins', 'skinsave', skin)
	if skin == nil then
		skin = 0
	end

	local defaultChar = boyfriendName
    local charName = selectcharacters[skin]
    local arr = stringSplit(defaultChar, "-")

	local suffix = ''

	for i = 2, #arr do
		suffix = suffix.."-"..arr[i];
	end

	local tempName = charName..suffix

    if #arr > 1 and checkFileExists("characters/"..charName..suffix..".json", false) then 
		charName = charName..suffix
	end

	setDataFromSave('selectskins', 'skinlist', selectcharacters)
	if skin == 0 then
		close()
	else
		triggerEvent('Change Character', 'bf', charName) -- reduce it to one line that calls the array for what to change it to.
	end

	init = true

	runHaxeCode([[
		import backend.Paths;

		var voxFile = PlayState.instance.boyfriend.vocalsFile;

		var playerVocals = Paths.voices(PlayState.instance.curSong, (voxFile == null || voxFile == "") ? 'Player' : voxFile);
		if (playerVocals == null) playerVocals = Paths.voices(PlayState.instance.curSong, 'Player');
		if (playerVocals == null) playerVocals = Paths.voices(PlayState.instance.curSong);

		PlayState.instance.vocals.loadEmbedded(playerVocals != null ? playerVocals : Paths.voices(curSong));
	]])
	
	--debugPrint(tempName..", "..charName);

	if mustHitSection and not gfSection then cameraSetTarget('boyfriend') end;
	
end

function onEvent(n, v1, v2, s)

	if string.lower(v1) ~= 'dad' and string.lower(v1) ~= 'opponent' and string.lower(v1) ~= 'gf' and string.lower(v1) ~= 'girlfriend' and init then -- i think it checks those four and defaults to BF

		if n == "Change Character" and string.lower(songName) ~= "skins" then

			init = false

			local defaultChar = boyfriendName
			local charName = selectcharacters[skin]
			local arr = stringSplit(defaultChar, "-")
		
			local suffix = ''
		
			for i = 2, #arr do
				suffix = suffix.."-"..arr[i];
			end
		
			local tempName = charName..suffix
		
			if #arr > 1 and checkFileExists("characters/"..charName..suffix..".json", false) then 
				charName = charName..suffix
			end
			
			triggerEvent('Change Character', 'bf', charName)

			init = true
	
		end

	end

end

function onEventPushed(n, v1, v2, s)

	if string.lower(v1) ~= 'dad' and string.lower(v1) ~= 'opponent' and string.lower(v1) ~= 'gf' and string.lower(v1) ~= 'girlfriend' then -- i think it checks those four and defaults to BF

		if n == "Change Character" and string.lower(songName) ~= "skins" then

			initSaveData('selectskins')
			selectcharacters = getDataFromSave('selectskins', 'skinlist')
			skin = getDataFromSave('selectskins', 'skinsave', skin)
			if skin == nil then
				skin = 0
			end

			local defaultChar = v2
			local charName = selectcharacters[skin]
			local arr = stringSplit(defaultChar, "-")
		
			local suffix = ''
		
			for i = 2, #arr do
				suffix = suffix.."-"..arr[i];
			end
		
			local tempName = charName..suffix
		
			if #arr > 1 and checkFileExists("characters/"..charName..suffix..".json", false) then 
				charName = charName..suffix
			end
			
			addCharacterToList(charName, 'bf');
	
		end

	end

end
-- Version 1.0.7