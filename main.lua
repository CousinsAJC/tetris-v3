function love.load()
    require "requires"
    math.randomseed(os.time())
    windowSettings()

    createGrid()
    loadPieces()

    myKeys = {}
end

function love.update(dt)

    myKeys = {}
end

function love.draw()
    drawGridDots()
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

