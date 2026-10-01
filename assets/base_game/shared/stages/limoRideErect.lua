function onCreatePost()
        initLuaShader('adjustColor')
        for i, object in ipairs({'boyfriend', 'dad', 'gf', 'car'}) do
            setSpriteShader(object, 'adjustColor')
            setShaderFloat(object, 'hue', -30)
            setShaderFloat(object, 'saturation', -20)
            setShaderFloat(object, 'contrast', 0)
            setShaderFloat(object, 'brightness', -30)
        end

		for i = 1, 5 do
            setSpriteShader('henchmen'..i, 'adjustColor')
            setShaderFloat('henchmen'..i, 'hue', -30)
            setShaderFloat('henchmen'..i, 'saturation', -20)
            setShaderFloat('henchmen'..i, 'contrast', 0)
            setShaderFloat('henchmen'..i, 'brightness', -30)
        end

		for i, object in ipairs({'lightPole', 'light', 'henchmenCorpse1', 'henchmenCorpse2'}) do
			setSpriteShader(object, 'adjustColor')
			setShaderFloat(object, 'hue', -30)
			setShaderFloat(object, 'saturation', -20)
			setShaderFloat(object, 'contrast', 0)
			setShaderFloat(object, 'brightness', -30)
		end
end
-- This function controls the events entirely, based on the 'curKillState'.
function updateKillingState(elapsed)
	for i = 1, #henchmenParticles do
						if luaSpriteExists(henchmenParticles[i]) then
							setSpriteShader(henchmenParticles[i], 'adjustColor')
							setShaderFloat(henchmenParticles[i], 'hue', -30)
							setShaderFloat(henchmenParticles[i], 'saturation', -20)
							setShaderFloat(henchmenParticles[i], 'contrast', 0)
							setShaderFloat(henchmenParticles[i], 'brightness', -30)
						end
		end
	end