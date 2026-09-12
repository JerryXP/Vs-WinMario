-- Put this file in mods/songs/YOUR-SONG-NAME/
local missLimit = 10
local videoName = 'nightmare' -- File in mods/videos/ (no extension)
local imageName = 'NightXP-NotVibin' -- File in mods/images/ (no extension)
local endSongTriggered = false

function onEndSong()
    if not endSongTriggered then
        if misses < missLimit then
            -- Play video
            startVideo(videoName)
            endSongTriggered = true
            return Function_Stop -- Stops song to play video
        else
            -- Show Image
            makeLuaSprite('endImage', imageName, 0, 0)
            setObjectCamera('endImage', 'other')
            addLuaSprite('endImage', true)
            
            -- Prevent ending the song
            endSongTriggered = true
            return Function_Stop
        end
    end
    return Function_Continue
end
