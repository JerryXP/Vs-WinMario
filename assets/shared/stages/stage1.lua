--This code is written by APlayer
--Credited if used!

function onCreate()

	--14.11.2024:
	-- Оффсеты теперь полностью соответствуют оригиналу.

	-- finished
	
	      --   Оффсетная вещь   --

	--setProperty('camZoomingMult', 0)
	--setProperty('cameraSpeed', 100)


	makeLuaSprite('stageBack', 'stage/lament/stageBack', -546, -152);
	setLuaSpriteScrollFactor('stageBack', 0.9, 0.9);
	
	makeLuaSprite('LamentStagefront', 'stage/lament/stageFront', -588, 638);
	setLuaSpriteScrollFactor('LamentStagefront', 0.9, 0.9);
	scaleObject('LamentStagefront', 1.095, 1.095);

	makeLuaSprite('step', 'stage/lament/stairs', -129, 62);-- -510, -210
    scaleObject('step', 1, 1);
	setLuaSpriteScrollFactor('step', 0.9, 0.9);

	if getPropertyFromClass('ClientPrefs', 'newPreload') == true then

	makeLuaSprite('preload1', 'characters/lament/dad2', 0, 0);
	setProperty('preload1.alpha', 0.001)
    addLuaSprite('preload1')

	end

	
	-- sprites that only load if Low Quality is turned off

	if not lowQuality then
		makeLuaSprite('DuskCurtains', 'stage/dusk/stagecurtains', -399, -155);-- -420, -190
		setLuaSpriteScrollFactor('DuskCurtains', 1.3, 1.3);
		scaleObject('DuskCurtains', 0.845, 0.845);
	end
	
	addLuaSprite('stageBack', false);
	addLuaSprite('LamentStagefront', false);
	addLuaSprite('step', false);
	addLuaSprite('DuskCurtains', false);
end