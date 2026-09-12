function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'kmc_20250417_182953 - Copy (3)', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	
    makeLuaSprite('stagefront', 'digitalfront', -200, 800);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end