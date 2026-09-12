function onCreate()
	makeLuaSprite('matrix', 'kmc_20250417_182953 - Copy (3)', -600, -300);
	setScrollFactor('matrix', 0.9, 0.9);
	addLuaSprite('matrix', false);
	
    makeLuaSprite('matrixF', 'digitalfront', -200, 800);
	setScrollFactor('matrixF', 0.9, 0.9);
	scaleObject('matrixF', 1.1, 1.1);
	addLuaSprite('matrixF', false);
end

function onStepHit()
	if curStep == 576 then 
		removeLuaSprite('matrix', true);
		removeLuaSprite('matrixF', true);

        makeLuaSprite('binary', 'BINARYhell-2', -600, -300);
		setScrollFactor('binary', 0.9, 0.9);
		addLuaSprite('binary', false);

		makeLuaSprite('binaryF', 'digitalfront', -200, 800);
		setScrollFactor('binaryF', 0.9, 0.9);
		scaleObject('binaryF', 1.1, 1.1);
		addLuaSprite('binaryF', false);
    end
	if curStep == 824 then 
		removeLuaSprite('binary', true);
		removeLuaSprite('binaryF', true);

        makeLuaSprite('matrix', 'kmc_20250417_182953 - Copy (3)', -600, -300);
		setScrollFactor('matrix', 0.9, 0.9);
		addLuaSprite('matrix', false);
	
    	makeLuaSprite('matrixF', 'digitalfront', -200, 800);
		setScrollFactor('matrixF', 0.9, 0.9);
		scaleObject('matrixF', 1.1, 1.1);
		addLuaSprite('matrixF', false);
    end
	if curStep == 1088 then 
		removeLuaSprite('matrix', true);
		removeLuaSprite('matrixF', true);

        makeLuaSprite('binary', 'BINARYhell-2', -600, -300);
		setScrollFactor('binary', 0.9, 0.9);
		addLuaSprite('binary', false);

		makeLuaSprite('binaryF', 'digitalfront', -200, 800);
		setScrollFactor('binaryF', 0.9, 0.9);
		scaleObject('binaryF', 1.1, 1.1);
		addLuaSprite('binaryF', false);
    end
	if curStep == 1336 then 
		removeLuaSprite('binary', true);
		removeLuaSprite('binaryF', true);

        makeLuaSprite('matrix', 'kmc_20250417_182953 - Copy (3)', -600, -300);
		setScrollFactor('matrix', 0.9, 0.9);
		addLuaSprite('matrix', false);
	
    	makeLuaSprite('matrixF', 'digitalfront', -200, 800);
		setScrollFactor('matrixF', 0.9, 0.9);
		scaleObject('matrixF', 1.1, 1.1);
		addLuaSprite('matrixF', false);
    end
end