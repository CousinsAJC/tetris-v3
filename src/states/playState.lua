PlayState = BaseState:extend()

function PlayState:enter()

end


function PlayState:update(dt)
    playStateKeys()
    if gameState == "paused" then
        return
    end
    
end


function PlayState:draw()
    if gameState == "paused" then
        pauseDraw()
    else
        if gridOn == 'on' then
            drawGridDots()
        end
    end
end