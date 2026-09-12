local t = 0
local s = 0
function onCreate()

    makeLuaSprite('stageback', 'dark/stagebackdark', -900, -300)
    addLuaSprite('stageback', false)
    setGraphicSize('stageback', getProperty('stageback.width') * 1.2)

    makeLuaSprite('curtains', 'dark/stagecurtainsDark', -900, -300)
    addLuaSprite('curtains')
    setScrollFactor('curtains', 0.95, 1)
    setGraphicSize('curtains', getProperty('curtains.width') * 1.2)

    makeLuaSprite('front', 'dark/stagefrontDark', -900,680)
    setGraphicSize('front', getProperty('front.width') * 1.2)
    addLuaSprite('front', false)
end

function onCreatePost()
    setProperty('gf.alpha', 1)
end