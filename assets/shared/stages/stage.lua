function onCreate()
	-- background shit
	makeLuaSprite('stagebackEvil', 'stagebackEvil', -600, -300);
	setScrollFactor('stagebackEvil', 0.9, 0.9);
	
	makeLuaSprite('stagefrontEvil', 'stagefrontEvil', -650, 600);
	setScrollFactor('stagefrontEvil', 0.9, 0.9);
	scaleObject('stagefrontEvil', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stageLightEvil', 'stageLightEvil', -600, -300);
		setScrollFactor('stageLightEvil', 0.9, 0.9);
		scaleObject('stageLightEvil', 1.1, 1.1);

		makeLuaSprite('stagecurtainsEvil', 'stagecurtainsEvil', -500, -300);
		setScrollFactor('stagecurtainsEvil', 1.3, 1.3);
		scaleObject('stagecurtainsEvil', 0.9, 0.9);
	end

	addLuaSprite('stagebackEvil', false);
	addLuaSprite('stagefrontEvil', false);
	addLuaSprite('stageLightEvil', true);
	addLuaSprite('stagecurtainsEvil', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end