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

    nextBox = {
        x = 385,
        y = 200,
        w = 80,
        h = 80,
        c = gray
    }

    grid = {}

    for i = 1, gridWidth + 1, 1 do
        grid[i] = {}
        for j = 1, gridHeight + 1, 1 do
            grid[i][j] = {startingX - CELLSIZE + (CELLSIZE * i), startingY - CELLSIZE + (CELLSIZE * j), false, nil}
        end
    end

    lockedTiles = {}
    for i = GRIDTOP, CELLSIZE, GRIDBOT - CELLSIZE do
        lockedTiles[i] = {}
    end

end

function drawLocked()
    if lockedTiles[1] ~= nil then
        for i = 1, #lockedTiles, 1 do
            love.graphics.setColor(lockedTiles[i].color)
            love.graphics.rectangle("fill", lockedTiles[i].x, lockedTiles[i].y, CELLSIZE, CELLSIZE)
            love.graphics.setColor(gray)
            love.graphics.rectangle("line", lockedTiles[i].x, lockedTiles[i].y, CELLSIZE, CELLSIZE)
        end
    end
end

function drawLockedGrid()
    for i = 1, gridWidth, 1 do
        for j = 1, gridHeight, 1 do
            if grid[i][j][3] == true then
                love.graphics.setColor(grid[i][j][4])
                love.graphics.rectangle('fill', grid[i][j][1], grid[i][j][2], CELLSIZE, CELLSIZE)
                love.graphics.setColor(gray)
                love.graphics.rectangle("line", grid[i][j][1], grid[i][j][2], CELLSIZE, CELLSIZE)
            end
        end
    end
end
