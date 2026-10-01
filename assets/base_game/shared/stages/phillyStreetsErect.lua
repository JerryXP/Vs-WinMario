function onCreatePost()
    if shadersEnabled == true then
        initLuaShader('adjustColor')

        for i, object in ipairs({'boyfriend', 'dad', 'gf'}) do
            setSpriteShader(object, 'adjustColor')

            setShaderFloat(object, 'hue', -5)     
            setShaderFloat(object, 'saturation', -40) 
            setShaderFloat(object, 'contrast', -25)    
            setShaderFloat(object, 'brightness', -20)
        end
    end
end