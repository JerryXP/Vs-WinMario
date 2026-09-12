local misslimit = 20 -- You can set this to any number you want!
function onUpdate(elapsed)
    if misses > misslimit then
        setProperty('health', 0)
    end
end