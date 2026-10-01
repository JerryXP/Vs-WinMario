function onCreatePost()
        initLuaShader('adjustColor')
        for i, object in ipairs({'boyfriend', 'dad', 'gf', 'santa'}) do
            setSpriteShader(object, 'adjustColor')
            setShaderFloat(object, 'hue', 5)
            setShaderFloat(object, 'saturation', 20)
            setShaderFloat(object, 'contrast', 0)
            setShaderFloat(object, 'brightness', 0)
        end
end