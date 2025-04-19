Piece = Object:extend()

function Piece:new(typ, stat, col)
    self.type = pieces[typ] --which letter piece
    self.pos = self.type['1'] --what rotation
    self.status = stat -- current piece or next piece

    if self.status == 'next' then
        self.color = colors[colorOpts[math.random(#colorOpts)]]
        self.pivot = {  --pivot point
            x = nextBox.x + 40,
            y = nextBox.y + 40
        }
    else
        self.color = col
        self.pivot = {
            x = startingX + .5 * gridWidth,
            y = startingY + CELLSIZE
        }
    end
    self.size = CELLSIZE

    self.timer = 1
    self.elapsedTime = 0
end

function Piece:update(dt)
    if self.status == 'current' then
        self:drop()
    end
end

function Piece:draw()
    love.graphics.setColor(self.color)
    --love.graphics.rectangle('fill', self.pivot.x, self.pivot.y, 1, 1)
    love.graphics.rectangle('fill', self.pivot.x + self.pos[1], self.pivot.y + self.pos[2], self.size, self.size)
    love.graphics.rectangle('fill', self.pivot.x + self.pos[3], self.pivot.y + self.pos[4], self.size, self.size)
    love.graphics.rectangle('fill', self.pivot.x + self.pos[5], self.pivot.y + self.pos[6], self.size, self.size)
    love.graphics.rectangle('fill', self.pivot.x + self.pos[7], self.pivot.y + self.pos[8], self.size, self.size)

    love.graphics.setColor(gray)
    love.graphics.rectangle('line', self.pivot.x + self.pos[1], self.pivot.y + self.pos[2], self.size, self.size)
    love.graphics.rectangle('line', self.pivot.x + self.pos[3], self.pivot.y + self.pos[4], self.size, self.size)
    love.graphics.rectangle('line', self.pivot.x + self.pos[5], self.pivot.y + self.pos[6], self.size, self.size)
    love.graphics.rectangle('line', self.pivot.x + self.pos[7], self.pivot.y + self.pos[8], self.size, self.size)
end

function Piece:drop()
    
end