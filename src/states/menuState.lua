MenuState = BaseState:extend()

function MenuState:enter(enterParams)
    
end


function MenuState:update(dt)
    menuStateKeys()
end


function MenuState:draw()
    mText = "Press 1 to play"
    love.graphics.setNewFont(36)
    menuFont = love.graphics.getFont()
    mTextW = menuFont:getWidth(mText)
    mTextH = menuFont:getHeight(mText)
    love.graphics.print(mText, winwidth/2 - mTextW/2, winheight/2 - mTextH/2)
end
