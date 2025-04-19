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
end

