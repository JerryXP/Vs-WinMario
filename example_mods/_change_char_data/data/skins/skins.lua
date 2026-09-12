skin = 0
enterpressed = 0
confirmed = false
selectcharacters = {'bf', 'pico-playable', 'tankman-playable'
, 'WINDOWS-player', 'PJ-player', 'Dino-player'} -- make it an array, to make it easier to add a character

function onCreate()
	initSaveData('selectskins')
	setDataFromSave('selectskins', 'skinlist', selectcharacters)
	selectcharacters = getDataFromSave('selectskins', 'skinlist')
	skin = getDataFromSave('selectskins', 'skinsave', skin)
	if skin == nil then
		skin = 0
	end

	setDataFromSave('selectskins', 'skinlist', selectcharacters)
	playSound('character select', 0.6, 'thereal', true)
end
function onCreatePost()
	for i = 0, #selectcharacters do
		addCharacterToList(selectcharacters[i], 'bf')
	end
	
	addCharacterToList('none', 'bf')
end
function onStartCountdown()
	setProperty('skipCountdown', true)
	setProperty('curStep', 0)
end

function onUpdate()
	selectcharacters = getDataFromSave('selectskins', 'skinlist')
	if skin < 0 then
		skin = #selectcharacters
	end
	if skin > #selectcharacters then
		skin = #selectcharacters - #selectcharacters
	end

	if skin == 0 then
		triggerEvent('Change Character', 'bf', 'none')
	end

	if keyJustPressed('left') and not confirmed then
		skin = skin - 1
		runTimer('redundant', 0.02, 1)
	end
	if keyJustPressed('right') and not confirmed then
		skin = skin + 1
		runTimer('redundant', 0.02, 1)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.pressed.ENTER') then
		runTimer('help', 0.02, 1)
		if not confirmed then 
			triggerEvent('Play Animation', 'hey', 'bf')
			setProperty('boyfriend.specialAnim', true)
			setDataFromSave('selectskins', 'skinsave', skin)
			runTimer('exittime', 3.3, 1)
			stopSound('thereal')
			playSound('character select confirm', 0.6, 'theend', false)
			confirmed = true
			setProperty('boyfriend.skipDance', true)
		end
	end
	if enterpressed == 2 then
		endSong()
	end
	--debugPrint(enterpressed)
end

timeElapsed = 0

function onUpdatePost(elapsed)
	timeElapsed = timeElapsed + elapsed * getProperty('playbackRate');
	setPropertyFromClass("backend.Conductor", 'songPosition', timeElapsed * 1000);
end

function onPause()
	return Function_Stop
end

function playMusic()
    runHaxeCode(
        [[
			import states.PlayState;
			//FlxG.sound.music.onComplete = PlayState.instance.startCountdown();

			FlxG.sound.music.onComplete = null;
			FlxG.sound.music.looped = true;
        ]]
    )
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'exittime' then
		endSong()
	end
	if tag == 'redundant' then
		triggerEvent('Change Character', 'bf', selectcharacters[skin]) -- reduce it to one line that calls the array for what to change it to.
		triggerEvent('Play Animation', 'idle', 'bf')
	end
	if tag == 'help' then
		enterpressed = enterpressed + 1
	end
end

function onBeatHit()
	playMusic();
end
-- Version 1.0.2