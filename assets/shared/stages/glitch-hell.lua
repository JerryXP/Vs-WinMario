function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'glitch/HELL/HELL_bg', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('mountain', 'glitch/HELL/HELL_mountain', -600, -300);
	setScrollFactor('mountain', 0.9, 0.9);

	makeLuaSprite('lava', 'glitch/HELL/HELL_lava', -600, -300);
	setScrollFactor('lava', 0.9, 0.9);

	makeLuaSprite('floor', 'glitch/HELL/HELL_floor', -600, -500);
	setScrollFactor('floor', 0.9, 0.9);

	makeLuaSprite('spike', 'glitch/HELL/HELL_spike', -600, -500);
	setScrollFactor('spike', 0.9, 0.9);

	addLuaSprite('stageback', false);
	addLuaSprite('mountain', false);
	addLuaSprite('lava', false);
	addLuaSprite('floor', false);
	addLuaSprite('spike', false);
end