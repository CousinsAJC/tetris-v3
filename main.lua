function love.load()
    require "src/requires"
    math.randomseed(os.time())
    windowSettings()

    loadColors()
    createGrid()
    loadPieces()
    setupGameStateMachine()

    gameState = "running"
    pauseText = "Pause"
    gridOn = 'on'

    myKeys = {}
    keyLog = {}
end

function love.update(dt)
    gsm:update(dt)
    myKeys = {}
end

function love.draw()
    drawKeystrokes()
    gsm:draw()
end

function windowSettings()
    winwidth, winheight = 500, 600

    love.window.setMode(winwidth, winheight, {
        fullscreen = false,
        resizable = false,
        borderless = false,
        vsync = true
    })
end



function setupGameStateMachine()
    gsm = StateMachine{
        ['menu'] = function() return MenuState() end,
        ['play'] = function() return PlayState() end,
        ['pause'] = function() return PauseState() end,
        ['game-over'] = function() return GameOverState() end
    }

    gsm:change(nil, 'menu')
end

function drawKeystrokes()
    love.graphics.setNewFont(14)
    keylogFont = love.graphics.getFont()
    love.graphics.setColor(gray)
    love.graphics.rectangle('fill', 0, 0, 170, 140)
    love.graphics.setColor(green)
    num = #keyLog
    if num >= 6 then
        love.graphics.print(keyLog[num], 0, 100)
        love.graphics.print(keyLog[num-1], 0, 80)
        love.graphics.print(keyLog[num-2], 0, 60)
        love.graphics.print(keyLog[num-3], 0, 40)
        love.graphics.print(keyLog[num-4], 0, 20)
        love.graphics.print(keyLog[num-5], 0, 0)
    else 
        if num >= 5 then
            love.graphics.print(keyLog[5], 0, 80)
        end
        if num >=4 then
            love.graphics.print(keyLog[4], 0, 60) 
        end
        if num >=3 then
            love.graphics.print(keyLog[3], 0, 40)
        end
        if num >=2 then
            love.graphics.print(keyLog[2], 0, 20)
        end
        if num >=1 then
            love.graphics.print(keyLog[1], 0, 0)
        end
    end
    love.graphics.setColor(white)
end
