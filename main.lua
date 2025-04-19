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
    ksDraw = 'on'

    myKeys = {}
    keyLog = {}
end

function love.update(dt)
    gsm:update(dt)
    myKeys = {}
end

function love.draw()
    if ksDraw == 'on' then
        drawKeystrokes()
    end
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


