function onCreate()
	-- background shit
	makeLuaSprite('windowsdead', 'kmc_20250129_145314', -600, -300);
	setScrollFactor('windowsdead', 0.9, 0.9);
	addLuaSprite('windowsdead', false);
end

function onStepHit()
	if songName == 'Ejected' or songName == 'Ejected (Pico)' or songName == 'Ejected (BF)' or songName == 'Ejected (GF)' then
		if curStep == 1024 then 
			removeLuaSprite('windowsdead', true);

        	makeLuaSprite('windowsdead-minus', 'kmc_20250129_145314 - Copy', -600, -300);
			setScrollFactor('windowsdead-minus', 0.9, 0.9);
			addLuaSprite('windowsdead-minus', false);
    	end

		if curStep == 1280 then 
			removeLuaSprite('windowsdead-minus', true);

        	makeLuaSprite('windowsdead', 'kmc_20250129_145314', -600, -300);
			setScrollFactor('windowsdead', 0.9, 0.9);
			addLuaSprite('windowsdead', false);
    	end

    	if curStep == 2048 then 
			removeLuaSprite('windowsdead', true);

        	makeLuaSprite('windowsdead-hell', 'kmc_20250830_141417', -600, -300);
			setScrollFactor('windowsdead-hell', 0.9, 0.9);
			addLuaSprite('windowsdead-hell', false);
    	end

		if curStep == 2304 then 
			removeLuaSprite('windowsdead-hell', true);

        	makeLuaSprite('windowsdead', 'kmc_20250129_145314', -600, -300);
			setScrollFactor('windowsdead', 0.9, 0.9);
			addLuaSprite('windowsdead', false);
    	end
	end
end