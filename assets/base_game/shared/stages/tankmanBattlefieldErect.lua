-- List of characters that depend on the abot system(You have to use the Hx scripts that are in the characters folder)
local gfAdjustFirstList = {'nene', 'nene-christmas'}

function isGFAdjustFirst(charName)
	for _, name in ipairs(gfAdjustFirstList) do
		if name == charName then return true end
	end
	return false
end

function onCreatePost()
	if shadersEnabled == true then
		runHaxeCode([[
            import flixel.math.FlxAngle;
			function setShaderFrameInfo(objectName:String) {
				var object:FlxSprite;
				switch(objectName) {
					case 'boyfriend':
                    	object = game.boyfriend;
                	case 'dad':
                    	object = game.dad;
                	case 'gf':
                    	object = game.gf;
                	default:
                    	object = game.getLuaObject(objectName);
				}

				object.animation.callback = function(name:String, frameNumber:Int, frameIndex:Int)
            	{
					if (object.shader != null) {
						object.shader.setFloatArray('uFrameBounds', [object.frame.uv.x, object.frame.uv.y, object.frame.uv.width, object.frame.uv.height]);
                		object.shader.setFloat('angOffset', object.frame.angle * FlxAngle.TO_RAD);
					}
            	}
			}
        ]])

		initLuaShader('dropShadow')
		initLuaShader('adjustColor')

        for i, object in ipairs({'boyfriend', 'dad', 'gf'}) do
			local isGF = object == 'gf'
			local gfChar = isGF and getProperty('gf.curCharacter') or nil

			if isGF and isGFAdjustFirst(gfChar) then
				setSpriteShader(object, 'adjustColor')
				setShaderFloat(object, 'hue', -38)
				setShaderFloat(object, 'saturation', -20)
				setShaderFloat(object, 'contrast', -25)
				setShaderFloat(object, 'brightness', -46)
			else
				setSpriteShader(object, 'dropShadow')
				setShaderFloat(object, 'hue', -38)
				setShaderFloat(object, 'saturation', -20)
				setShaderFloat(object, 'contrast', -25)
				setShaderFloat(object, 'brightness', -46)
				setShaderFloat(object, 'ang', math.rad(object == 'dad' and 135 or 90))
				setShaderFloat(object, 'str', 1)
				setShaderFloat(object, 'dist', 15)
				setShaderFloat(object, 'thr', object == 'dad' and 0.3 or 0.1)
				setShaderFloat(object, 'AA_STAGES', 2)
				setShaderFloatArray(object, 'dropColor', {223 / 255, 239 / 255, 60 / 255})
			end

			runHaxeFunction('setShaderFrameInfo', {object})

			local imageFile = stringSplit(getProperty(object..'.imageFile'), '/')
			if checkFileExists('images/characters/masks/'..imageFile[#imageFile]..'_mask.png') then
				setShaderSampler2D(object, 'altMask', 'characters/masks/'..imageFile[#imageFile]..'_mask')
				setShaderFloat(object, 'thr2', 1)
				setShaderBool(object, 'useMask', true)
			else
				setShaderBool(object, 'useMask', false)
			end

			if _G[object..'Name'] == 'gf-tankmen' then
				setShaderFloat(object, 'thr2', 0.4)
			end
		end
	end
end

function onCountdownTick(swagCounter)
	if swagCounter == 2 then
		local gfChar = getProperty('gf.curCharacter')
		if isGFAdjustFirst(gfChar) then
			setSpriteShader('gf', 'dropShadow')
			setShaderFloat('gf', 'hue', -38)
			setShaderFloat('gf', 'saturation',-20)
			setShaderFloat('gf', 'contrast', -25)
			setShaderFloat('gf', 'brightness', -46)
			setShaderFloat('gf', 'ang', math.rad(90))
			setShaderFloat('gf', 'str', 1)
			setShaderFloat('gf', 'dist', 15)
			setShaderFloat('gf', 'thr', 0.1)
			setShaderFloat('gf', 'AA_STAGES', 2)
			setShaderFloatArray('gf', 'dropColor', {223 / 255, 239 / 255, 60 / 255})
			runHaxeFunction('setShaderFrameInfo', {'gf'})
		end -- ← This was missing
	end
end

function onSongStart()
	local gfChar = getProperty('gf.curCharacter')
	if shadersEnabled and isGFAdjustFirst(gfChar) then
		setSpriteShader('gf', 'dropShadow')
		setShaderFloat('gf', 'hue', -38)
		setShaderFloat('gf', 'saturation', -20)
		setShaderFloat('gf', 'contrast', -25)
		setShaderFloat('gf', 'brightness', -46)
		setShaderFloat('gf', 'ang', math.rad(90))
		setShaderFloat('gf', 'str', 1)
		setShaderFloat('gf', 'dist', 15)
		setShaderFloat('gf', 'thr', 0.1)
		setShaderFloat('gf', 'AA_STAGES', 2)
		setShaderFloatArray('gf', 'dropColor', {223 / 255, 239 / 255, 60 / 255})
		runHaxeFunction('setShaderFrameInfo', {'gf'})

		local imageFile = stringSplit(getProperty('gf.imageFile'), '/')
		if checkFileExists('images/MaskChange') then
			setShaderSampler2D('gf', 'altMask', 'characters/masks/'..imageFile[#imageFile]..'_mask')
			setShaderFloat('gf', 'thr2', 1)
			setShaderBool('gf', 'useMask', true)
		else
			setShaderBool('gf', 'useMask', false)
		end

		if _G['gfName'] == 'gf-tankmen' then
			setShaderFloat('gf', 'thr2', 0.4)
		end
	end
end