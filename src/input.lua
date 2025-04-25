function love.keypressed(key)
    addToSet(myKeys, key)
    log = tostring(key .. "  " .. "::" .. "  " .. os.date("%H:%M:%S %m/%d/%y"))
    table.insert(keyLog, log)
    if key == "escape" then
        love.event.quit()
    end
    if setContains(myKeys, 'k') == true then
        ksDraw = ksDraw == "on" and "off" or "on"
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

    if setContains(myKeys, 'a') == true then
        if currentPiece ~= nil then
            currentPiece:canRotate('left')
        end
    end

    if setContains(myKeys, 'd') == true then
        if currentPiece ~= nil then
            currentPiece:canRotate('right')
        end
    end

    if setContains(myKeys, 'right') == true then
        if currentPiece ~= nil then
            currentPiece:canMoveRight()
        end
    end

    if setContains(myKeys, 'left') == true then
        if currentPiece ~= nil then
            currentPiece:canMoveLeft()
        end
    end

    if setContains(myKeys, 'down') == true then
        if currentPiece ~= nil then
            currentPiece:canMoveDown()
        end
    end
end

function menuStateKeys()
    if setContains(myKeys, '1') == true then
        gsm:change('menu', 'play')
    end
end

