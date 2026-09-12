function onUpdate()

-- For Health 100%
-- Purple // Magenta
if (getProperty("health")*50) > 100 then 
    doTweenColor('GoodHealth', 'healthText', 'FF00FF', 0.1, 'linear')
end

-- For Health Between 99 and 61
-- Blue
if (getProperty("health")*50) < 99 and (getProperty("health")*50) > 61 then 
    doTweenColor('GoodHealth', 'healthText', '0080FF', 0.1, 'linear')
end

-- For Health Between 60 and 41
-- Green
if (getProperty("health")*50) < 60 and (getProperty("health")*50) > 41 then 
    doTweenColor('GoodHealth', 'healthText', '00FF00', 0.1, 'linear')
end

-- For Health Between 40 and 21
-- Yellow
if (getProperty("health")*50) < 40 and (getProperty("health")*50) > 21 then 
    doTweenColor('GoodHealth', 'healthText', 'FFFF00', 0.1, 'linear')
end

-- For Health Between 20 and 11
-- Orange
if (getProperty("health")*50) < 20 and (getProperty("health")*50) > 11 then 
    doTweenColor('GoodHealth', 'healthText', 'FF0000', 0.1, 'linear')
end

-- For Health under 10% (DANGER)
-- Red
if (getProperty("health")*50) < 10 then 
    doTweenColor('GoodHealth', 'healthText', '800000', 0.1, 'linear')
end

end