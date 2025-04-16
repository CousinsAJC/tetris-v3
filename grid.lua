function createGrid()
    startingX = 150
    startingY = 100
    gridWidth = 10
    gridHeight = 20

    CELLSIZE = 20
    GRIDLEFT = startingX
    GRIDRIGHT = startingX + (CELLSIZE * gridWidth)
    GRIDTOP = startingY
    GRIDBOT = startingY + (CELLSIZE * gridHeight)

    grid = {}

    for i = 1, gridWidth + 1, 1 do
        grid[i] = {}
        for j = 1, gridHeight + 1, 1 do
            grid[i][j] = {startingX - CELLSIZE + (CELLSIZE * i), startingY - CELLSIZE + (CELLSIZE * j), false, nil}
        end
    end
end

function drawGridDots()
    love.graphics.setColor(1,1,1,1)
    for i = 1, gridWidth + 1, 1 do
        for j = 1, gridHeight + 1, 1 do
            love.graphics.rectangle("fill", grid[i][j][1], grid[i][j][2], 1, 1)
        end
    end
end