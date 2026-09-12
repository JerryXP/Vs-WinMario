function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'StarStage/stageback', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	addLuaSprite('stageback', false);

	if not lowQuality then
		makeLuaSprite('walls', 'custom-walls/special2', -200, -300);
		setScrollFactor('walls', 0.9, 0.9);
		scaleObject('walls', 0.7, 0.7);
		addLuaSprite('walls', false);

		makeLuaSprite('walls-extras', 'custom-walls/special2_extra', -110, -300);
		setScrollFactor('walls-extras', 0.9, 0.9);
		scaleObject('walls-extras', 0.65, 0.65);
		addLuaSprite('walls-extras', false);

		makeLuaSprite('walls-social', 'custom-walls/special2_social', -110, -65);
		setScrollFactor('walls-social', 0.9, 0.9);
		scaleObject('walls-social', 0.65, 0.65);
		addLuaSprite('walls-social', false);
	end
	
	makeLuaSprite('stagefront', 'StarStage/stagefront', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);
	addLuaSprite('stagefront', false);

	makeLuaSprite('stagecurtains', 'StarStage/stagecurtains', -500, -300);
	setScrollFactor('stagecurtains', 1.3, 1.3);
	scaleObject('stagecurtains', 1.0, 1.0);
	addLuaSprite('stagecurtains', false);
end