function pauseDraw()
    love.graphics.setNewFont(48)
    pauseFont = love.graphics.getFont()
    pTextW = pauseFont:getWidth(pauseText)
    pTextH = pauseFont:getHeight(pauseText)
    love.graphics.setColor(orange)
    love.graphics.print(pauseText, winwidth/2 - pTextW/2, winheight/2 - pTextH/2)
    print()
end