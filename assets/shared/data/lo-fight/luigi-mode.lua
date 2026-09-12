function onUpdate(elapsed)
    -- Check if botplay is enabled
    if getProperty('cpuControlled') then
        -- Change player strum notes (downscroll/upscroll)
        for i = 0, getProperty('playerStrums.length')-1 do
            setPropertyFromGroup('playerStrums', i, 'texture', 'marioUI/NOTE_assets-botplay');
        end

        -- Change player notes
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'marioUI/NOTE_assets-botplay');
            end
        end
    end
end

function onStartCountdown()
setTextString('botplayTxt', 'LUIGI ASSIST MODE')
setTextColor('botplayTxt', '00ff00')
end