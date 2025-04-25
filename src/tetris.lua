function tetrisClearAndDrop()
    local row = true
    local empties = {}
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
    end
    moveRowsDown()
end

function moveRowsDown()
    --goto lowest empty line
    --move everything above down
    --repeat
end



function clearRow(r)
    for i = 1, gridWidth, 1 do
        grid[i][r][3] = false
        grid[i][r][4] = nil
    end
end