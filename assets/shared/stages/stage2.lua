--This code is written by APlayer
--Credited if used!

function onCreate()
    --??.10.2024:
	-- Оффсеты почти соответствуют оригиналу

	--16.10.2024:
	--Сделана катсцена глаза(По-кадрово)

	--14.11.2024:
	--Оффсеты теперь полностью соответствуют оригиналу

	-- finished
	
	      --   Оффсетная вещь   --

	--setProperty('camZoomingMult', 0)
	--setProperty('cameraSpeed', 100)

	makeLuaSprite('DuskBG', 'stage/dusk/DuskBG', -545, -150);-- -510, -210
    scaleObject('DuskBG', 1.0, 1.0);
	setLuaSpriteScrollFactor('DuskBG', 0.9, 0.9);
	
	makeLuaSprite('DuskStagefront', 'stage/dusk/DuskStagefront', -588, 648);-- -550, 630
	setLuaSpriteScrollFactor('DuskStagefront', 0.9, 0.9);
	scaleObject('DuskStagefront', 1.095, 1.095);

    if not lowQuality then

    makeLuaSprite('step', 'stage/dusk/stepl', -545, -300);-- -510, -210
    scaleObject('step', 1.0, 1.14);
	setLuaSpriteScrollFactor('step', 0.9, 0.9);

	makeLuaSprite('DuskCurtains', 'stage/dusk/stagecurtains', -399, -152);-- -420, -190
	setLuaSpriteScrollFactor('DuskCurtains', 1.3, 1.3);
	scaleObject('DuskCurtains', 0.845, 0.845);

	end

	addLuaSprite('DuskBG', false);
	addLuaSprite('DuskStagefront', false);
	addLuaSprite('step', false)
	addLuaSprite('DuskCurtains', false);
end