function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'WIN/erect/stageback', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);

	makeLuaSprite('sign', 'WIN/erect/sign', 150, -300);
	setScrollFactor('sign', 0.9, 0.9);
	scaleObject('sign', 0.4, 0.4);

	makeLuaSprite('walls', 'custom-walls/special1', -200, -300);
	setScrollFactor('walls', 0.9, 0.9);
	scaleObject('walls', 0.7, 0.7);
	
	makeLuaSprite('stagefront', 'WIN/erect/stagefront', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagecurtains', 'WIN/erect/stagecurtains', -500, -300);
		setScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 1, 1);
	end

	addLuaSprite('stageback', false);
	addLuaSprite('sign', false);
	addLuaSprite('walls', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagecurtains', false);
end