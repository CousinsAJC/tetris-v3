function tetrisClearAndDrop()
    --local row = true
    for i = gridHeight, 1, -1 do
        row = true
        for j = 1, gridWidth, 1 do
            if grid[j][i][3] == false then
                row = false
                break
            end
        end
        if row == true then
            clearRow(i)
        end
        checkForEmptyRows()
    end
    
end

function checkForEmptyRows()
    empty = true
    for i = gridHeight, 1, -1 do
        for j = 1, gridWidth, 1 do
            if grid[j][i][3] == true then
                empty = false
            end
        end
        if empty == true then
            moveRowsDown(i)
        end
    end
end

function moveRowsDown(r)
    row = r
    for i = row-1, 1, -1 do
        for j = 1, gridWidth, 1 do
            if grid[j][i][3] == true then
                grid[j][i+1][3] = grid[j][i][3]
                grid[j][i+1][4] = grid[j][i][4]
                grid[j][i][3] = false
                grid[j][i][4] = nil
            end
        end
    end
end





function clearRow(r)
    for i = 1, gridWidth, 1 do
        grid[i][r][3] = false
        grid[i][r][4] = nil
    end
end