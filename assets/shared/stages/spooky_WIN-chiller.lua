--makeLuaSprite('thunderFlash', nil, -800, -400);
--"nil" means it loads no image sprites for optimization's sake, instead we create our own white square image with makeGraphic

animatedStage = false;

function onCreate()
	makeLuaSprite('halloweenBG', 'halloween_bg_low_WIN', -200, -100);
	addLuaSprite('halloweenBG', false);
end


function onStepHit()
    if curStep == 384 then 
		removeLuaSprite('halloweenBG', true);

        makeLuaSprite('halloweenBG-orange', 'chiller-stage/orange', -200, -100);
		addLuaSprite('halloweenBG-orange', false);
    end

	if curStep == 640 then 
        removeLuaSprite('halloweenBG-orange', true);
		removeLuaSprite('thunderFlash-orange', true);

        makeLuaSprite('halloweenBG-blue', 'chiller-stage/blue', -200, -100);
		addLuaSprite('halloweenBG-blue', false);
    end

	if curStep == 896 then 
          removeLuaSprite('halloweenBG-blue', true);
		removeLuaSprite('thunderFlash-blue', true);

        makeLuaSprite('halloweenBG-green', 'chiller-stage/green', -200, -100);
		addLuaSprite('halloweenBG-green', false);
    end

	if curStep == 1024 then 
        removeLuaSprite('halloweenBG-green', true);
		removeLuaSprite('thunderFlash-green', true);

        makeLuaSprite('halloweenBG-red', 'chiller-stage/red', -200, -100);
		addLuaSprite('halloweenBG-red', false);
    end

	if curStep == 1152 then 
        removeLuaSprite('halloweenBG-red', true);
		removeLuaSprite('thunderFlash-red', true);

        makeLuaSprite('halloweenBG-purple', 'chiller-stage/purple', -200, -100);
		addLuaSprite('halloweenBG-purple', false);
    end

	if curStep == 1280 then 
		removeLuaSprite('halloweenBG-purple', true);
		removeLuaSprite('thunderFlash-purple', true);

        makeLuaSprite('halloweenBG', 'halloween_bg_low_WIN', -200, -100);
		addLuaSprite('halloweenBG', false);
	end
end