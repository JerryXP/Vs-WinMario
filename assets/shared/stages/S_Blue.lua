
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'bf-stage/stagebackBlue', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	addLuaSprite('stageback', false);

	if songName == 'Carefree' or songName == 'Win-High' or songName == 'Boogie' then
		-- Paula Version
		if not lowQuality then
			makeLuaSprite('walls', 'custom-walls/special3', -200, -300);
			setScrollFactor('walls', 0.9, 0.9);
			scaleObject('walls', 0.7, 0.7);
			addLuaSprite('walls', false);

			makeLuaSprite('walls-extras', 'custom-walls/special3_extra', -200, -300);
			setScrollFactor('walls-extras', 0.9, 0.9);
			scaleObject('walls-extras', 0.7, 0.7);
			addLuaSprite('walls-extras', false);

			makeLuaSprite('walls-social', 'custom-walls/special3_social', -400, 130);
			setScrollFactor('walls-social', 0.9, 0.9);
			scaleObject('walls-social', 0.45, 0.45);
			addLuaSprite('walls-social', false);
		end
	end
	
	makeLuaSprite('stagefront', 'bf-stage/bluestage', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);
	addLuaSprite('stagefront', false);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagecurtains', 'bf-stage/bluelights', -500, -300);
		setScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);
		addLuaSprite('stagecurtains', false);
	end
end