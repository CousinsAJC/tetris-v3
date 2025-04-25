PlayState = BaseState:extend()

function PlayState:enter()
    nextPiece = nil
    currentPiece = nil
    --createNewCurrent()
    --createNewNext()
end


function PlayState:update(dt)
    if gameState == "paused" then
        if setContains(myKeys, 'p') == true then
            gameState = gameState == "running" and "paused" or "running"
        end
        return
    end
    playStateKeys()
    if nextPiece == nil then
        createNewNext()
    end
    if currentPiece == nil then
        createNewCurrent()
    end
    if nextPiece ~= nil then
        nextPiece:update(dt)
    end
    if currentPiece ~= nil then
        currentPiece:update(dt)
    end
    testLines(dt)
end


function PlayState:draw()
    if gameState == "paused" then
        pauseDraw()
    else
        if gridOn == 'on' then
            drawGridDots()
            drawNextBox()
        end
        if nextPiece ~= nil then
            nextPiece:draw()    
        end
        if currentPiece ~= nil then
            currentPiece:draw()
        end
        --drawLocked()
        drawLockedGrid()
    end

end

function createNewNext()
    letter = types[math.random(#types)]
    nextPiece = Piece(letter, 'next')
    --nextPiece = Piece('o', 'next')
end

function createNewCurrent()
    currentPiece = Piece(nextPiece.letter, 'current', nextPiece.color)
    createNewNext()
end

function testLines(dt)
    
end