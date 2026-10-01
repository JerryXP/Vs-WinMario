function onCreatePost()
    initLuaShader('adjustColor')
        for i, object in ipairs({'boyfriend', 'dad', 'gf', 'train'}) do
            setSpriteShader(object, 'adjustColor')
            setShaderFloat(object, 'hue', -26)
            setShaderFloat(object, 'saturation', -16)
            setShaderFloat(object, 'contrast', 0)
            setShaderFloat(object, 'brightness', -5)
        end
end

-- Everything from this point is for the 'Philly Glow' event
function onEvent(eventName, value1, value2, strumTime)
	if eventName == 'Philly Glow' then
		if value1 == '0' then -- Deactivates the event.
			for i, object in ipairs({'boyfriend', 'dad', 'gf'}) do
				setProperty(object..'.color', 0xFFFFFF)
				-- Re-enabling the shaders here since we removed them.
				setSpriteShader(object, 'adjustColor')
				setShaderFloat(object, 'hue', -26)
				setShaderFloat(object, 'saturation', -16)
				setShaderFloat(object, 'contrast', 0)
				setShaderFloat(object, 'brightness', -5)
			end
		elseif value1 == '1' then -- Activates the event, and/or chooses a random color.
			for i, object in ipairs({'boyfriend', 'dad', 'gf'}) do
			-- Removing the shader here or else we can't change the character's colors
			removeSpriteShader(object)
		end
	end
end
end