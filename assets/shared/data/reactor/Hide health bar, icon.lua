cutscenetriggered = false
function onStartCountdown()

    setProperty('healthBar.alpha', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    if cutscenetriggered then
        return Function_Continue
 
    end

end

