function onCreate()
	makeLuaSprite('back', 'menuDesat', 0,0)
        setProperty('back.camera', instanceArg('camOther'), false, true)
	setObjectOrder('back', 0);
	addLuaSprite('back', false)
	makeLuaText('skintext', 'Current Skin:', 300, 525, 100)
        setProperty('skintext.camera', instanceArg('camOther'), false, true)
	setTextColor('skintext', 'C8C8C8')
	addLuaText('skintext', true);
	setTextSize('skintext', 35);
	makeLuaText('cntrltext', 'Use Left And Right To Switch Skins', 800, 275, 625)
        setProperty('cntrltext.camera', instanceArg('camOther'), false, true)
	setObjectOrder('cntrltext', 9);
	setTextColor('cntrltext', 'C8C8C8')
	addLuaText('cntrltext', true);
	setTextSize('cntrltext', 35);
end
function onCreatePost()
	setProperty('dad.alpha', 0);
	setProperty('gf.alpha', 0);
	setProperty('camHUD.visible', false);
	setObjectOrder('boyfriendGroup', 7);
	setObjectOrder('skintext', 8);
	setObjectOrder('cntrltext', 9);
end
function onUpdate()

	-- trying smth
	bfR = getProperty('boyfriend.healthColorArray[0]')
    bfG = getProperty('boyfriend.healthColorArray[1]')
    bfB = getProperty('boyfriend.healthColorArray[2]')
    bf2R = getProperty('boyfriend.healthColorArray[0]') - 50
    bf2G = getProperty('boyfriend.healthColorArray[1]') - 50
    bf2B = getProperty('boyfriend.healthColorArray[2]') - 50

	if bf2R < 0 then
		bf2R = 0
	end
	if bf2G < 0 then
		bf2G = 0
	end
	if bf2B < 0 then
		bf2B = 0
	end

	bgColor = rgbToHex1(getProperty('boyfriend.healthColorArray'))
	doTweenColor('bgtween', 'back', bgColor, 0.5, 'linear')
	setProperty('boyfriend.camera', instanceArg('camOther'), false, true)

	--debugPrint(bgColor)
end

function rgbToHex1(rgb1)
    rgb1 = (bfR * 0x10000) + (bfG * 0x100) + bfB
    return string.format("%x", rgb1)
end

function rgbToHex2(rgb2)
    rgb2 = (bf2R * 0x10000) + (bf2G * 0x100) + bf2B
    return string.format("%x", rgb2)
end
-- Version 1.0.1