local lastNoteRating = "unknown"

function goodNoteHit(id, direction, noteType, isSustainNote)
	local rating = getPropertyFromGroup('notes', id, 'rating')

    if swagPlayAnimation then

	    if isSustainNote then rating = lastNoteRating end

        if rating == 'shit' and direction == 0 then
            characterPlayAnim('boyfriend','singLEFT-miss','true')
        elseif rating == 'shit' and direction == 1 then
            characterPlayAnim('boyfriend','singDOWN-miss','true')
        elseif rating == 'shit' and direction == 2 then
            characterPlayAnim('boyfriend','singUP-miss','true')
        elseif rating == 'shit' and direction == 3 then
            characterPlayAnim('boyfriend','singRIGHT-miss','true')
        end

	    lastNoteRating = rating
    end
end

