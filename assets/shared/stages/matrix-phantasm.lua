function onCreate()
	makeLuaSprite('DigitalBack-b', 'kmc_20250417_182953 - Copy (3)', -600, -300);
	setScrollFactor('DigitalBack-b', 0.9, 0.9);
	
    makeLuaSprite('DigitalFront-b', 'digitalfront', -200, 800);
	setScrollFactor('DigitalFront-b', 0.9, 0.9);
	scaleObject('DigitalFront-b', 1.1, 1.1);

	addLuaSprite('DigitalBack-b', false);
	addLuaSprite('DigitalFront-b', false);
end

function onStepHit()
    if curStep == 384 or curStep == 768 or curStep == 1280 or curStep == 1536 then 
        removeLuaSprite('DigitalBack-b', true)
        removeLuaSprite('DigitalFront-b', true)

        makeLuaSprite('DigitalBack-r', 'kmc_20250417_182953 - Copy', -600, -300)
        setScrollFactor('DigitalBack-r', 0.9, 0.9)
        addLuaSprite('DigitalBack-r', false)
        
        makeLuaSprite('DigitalFront-r', 'digitalfront', -200, 800)
        setScrollFactor('DigitalFront-b', 0.9, 0.9);
	    scaleObject('DigitalFront-b', 1.1, 1.1);
        addLuaSprite('DigitalFront-r', false)
    end

    if curStep == 640 or curStep == 1024 or curStep == 1408 or curStep == 1792 then
        removeLuaSprite('DigitalBack-r', true)
        removeLuaSprite('DigitalFront-r', true)
        
        makeLuaSprite('DigitalBack-b', 'kmc_20250417_182953 - Copy (3)', -600, -300);
	    setScrollFactor('DigitalBack-b', 0.9, 0.9);
	
        makeLuaSprite('DigitalFront-b', 'digitalfront', -200, 800);
	    setScrollFactor('DigitalFront-b', 0.9, 0.9);
	    scaleObject('DigitalFront-b', 1.1, 1.1);

	    addLuaSprite('DigitalBack-b', false);
	    addLuaSprite('DigitalFront-b', false);
    end
end