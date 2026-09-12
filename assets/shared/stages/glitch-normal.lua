function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'glitch/glitch_bg', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('table', 'glitch/glitch_table', 550, 300);
	setScrollFactor('table', 0.9, 0.9);
	scaleObject('table', 0.4, 0.4);

	makeLuaSprite('laptop', 'glitch/glitch_laptop', 560, 160);
	setScrollFactor('laptop', 0.9, 0.9);
	scaleObject('laptop', 0.3, 0.3);

	addLuaSprite('stageback', false);
	addLuaSprite('table', false);
	addLuaSprite('laptop', false);
end