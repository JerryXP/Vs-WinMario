function onCreate()
    makeLuaText('healthText', 'HP: ' .. math.floor(getProperty("health") * 50), 300, screenWidth / 2 - -910 / 2, screenHeight / 2 - -500 / 1.5)
    addLuaText('healthText')
    setTextSize('healthText', 20);
    setTextFont('healthText', 'LCD2B___.ttf');
end
function onUpdate(elapsed)
	-- start of "update", some variables weren't updated yet
    setTextString('healthText', 'HP: ' .. math.floor(getProperty("health") * 50))
end

