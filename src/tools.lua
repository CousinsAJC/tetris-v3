

function drawGridDots()
    love.graphics.setColor(white)
    for i = 1, gridWidth + 1, 1 do
        for j = 1, gridHeight + 1, 1 do
            love.graphics.rectangle("fill", grid[i][j][1], grid[i][j][2], 1, 1)
        end
    end
end

function drawNextBox()
    love.graphics.setColor(gray)
    --love.graphics.rectangle('line', nextBox.x, nextBox.y, nextBox.w, nextBox.h)
    love.graphics.setColor(white)
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