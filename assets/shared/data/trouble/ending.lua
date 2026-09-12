local cool = false
function onUpdate()
    if cool then
        if keyJustPressed('accept') then
            endSong()
        end
    end
end


function onEndSong()
    if isStoryMode then
        if not cool then
            playMusic('freakyMenu', 1)
            makeLuaSprite('end', 'BSOD', 0, 0);
            setObjectCamera('end', 'camOther');
            addLuaSprite('end', true);
            cool = true
            return Function_Stop;
        end
        return Function_Continue;
    end
end