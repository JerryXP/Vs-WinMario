function onCreatePost()
	initLuaShader('adjustColor')
	setSpriteShader('boyfriend', 'adjustColor')
	setSpriteShader('dad', 'adjustColor')
	setSpriteShader('gf', 'adjustColor')

	setShaderFloat('boyfriend', 'hue', 12)
	setShaderFloat('boyfriend', 'saturation', 0)
	setShaderFloat('boyfriend', 'contrast', 7)
	setShaderFloat('boyfriend', 'brightness', -23)
		
	setShaderFloat('dad', 'hue', -32)
	setShaderFloat('dad', 'saturation', 0)
	setShaderFloat('dad', 'contrast', -23)
	setShaderFloat('dad', 'brightness', -33)

	setShaderFloat('gf', 'hue', -9)
	setShaderFloat('gf', 'saturation', 0)
	setShaderFloat('gf', 'contrast', -4)
	setShaderFloat('gf', 'brightness', -30)
end