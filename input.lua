function love.keypressed(key)
    addToSet(myKeys, key)
    if key == "escape" then
        love.event.quit()
    end
end

function addToSet(set, key) --see the linked answer for more functions like this
    set[key] = true
end

function setContains(set, key)
    return set[key] ~= nil
end

function playStateKeys()
    if setContains(myKeys, 'p') == true then
        gameState = gameState == "running" and "paused" or "running"
    end

    if setContains(myKeys, 'g') == true then
        gridOn = gridOn == "on" and "off" or "on"
    end
end

function menuStateKeys()
    if setContains(myKeys, '1') == true then
        gsm:change('play')
    end
end

