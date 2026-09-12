function onCreatePost()
  setProperty('allowDebugKeys', false); -- prevents key from doing anything
end

function onUpdate()

if keyJustPressed('debug_1') then

    debugPrint('NO CHEATING LOSER!!! LOL!!!') -- type it :)
end
end