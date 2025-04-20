Piece = Object:extend()

function Piece:new(typ, stat, col)
    self.letter = typ
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
            x = startingX + (gridWidth/2) * CELLSIZE,
            y = startingY + CELLSIZE
        }
    end
    self.size = CELLSIZE

    self.timer = 1
    self.elapsedTime = 0
end

function Piece:update(dt)
    if self.status == 'current' then
        self:drop(dt)
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

function Piece:drop(dt)
    if self.elapsedTime > self.timer then
        self.elapsedTime = 0
        self:canMoveDown()
        --lock in piece and start process over
    else
        self.elapsedTime = self.elapsedTime + dt
    end
end

function Piece:rotateRight()
    if self.pos == self.type['1'] then
        self.pos = self.type['2']
    elseif self.pos == self.type['2'] then
        self.pos = self.type['3']
    elseif self.pos == self.type['3'] then
        self.pos = self.type['4']
    else self.pos = self.type['1']
    end
end


function Piece:rotateLeft()
    if self.pos == self.type['4'] then
        self.pos = self.type['3']
    elseif self.pos == self.type['3'] then
        self.pos = self.type['2']
    elseif self.pos == self.type['2'] then
        self.pos = self.type['1']
    else self.pos = self.type['4']
    end
end

function Piece:moveLeft()
    self.pivot.x = self.pivot.x - CELLSIZE
end

function Piece:moveRight()
    self.pivot.x = self.pivot.x + CELLSIZE
end

function Piece:moveDown()
    self.pivot.y = self.pivot.y + CELLSIZE
end

function Piece:canMoveLeft()
    if self.pivot.x + self.pos[1] >= GRIDLEFT + CELLSIZE and self.pivot.x + self.pos[3] >= GRIDLEFT + CELLSIZE and
        self.pivot.x + self.pos[5] >= GRIDLEFT + CELLSIZE and self.pivot.x + self.pos[7] >= GRIDLEFT + CELLSIZE then
            self:moveLeft()
    else
        --playErrorSound
    end
end

function Piece:canMoveRight()
    if self.pivot.x + self.pos[1] <= GRIDRIGHT - 2*CELLSIZE and 
        self.pivot.x + self.pos[3] <= GRIDRIGHT - 2*CELLSIZE and
        self.pivot.x + self.pos[5] <= GRIDRIGHT - 2*CELLSIZE and 
        self.pivot.x + self.pos[7] <= GRIDRIGHT - 2*CELLSIZE 
    then
            self:moveRight()
    else
        --playErrorSound
    end
end

function Piece:canMoveDown()
    if self.pivot.y + self.pos[2] <= GRIDBOT - 2*CELLSIZE and 
        self.pivot.y + self.pos[4] <= GRIDBOT - 2*CELLSIZE and
        self.pivot.y + self.pos[6] <= GRIDBOT - 2*CELLSIZE and 
        self.pivot.y + self.pos[8] <= GRIDBOT - 2*CELLSIZE  and 
        self:lockedBelow() == false then
            self:moveDown()
    else
        self:lockPiece()
        currentPiece = nil
        --playErrorSound
    end
end

function Piece:lockPiece()
    self:lockTile(1,2)
    self:lockTile(3,4)
    self:lockTile(5,6)
    self:lockTile(7,8)
end

function Piece:lockTile(a, b)
    local tile = {
        x = self.pivot.x + self.pos[a],
        y = self.pivot.y + self.pos[b],
        color = self.color
    }
    table.insert(lockedTiles, tile)
end

function Piece:lockedBelow()
    for i = #lockedTiles, 1, -1 do
        if (self.pivot.x + self.pos[1] == lockedTiles[i].x and
            self.pivot.y + self.pos[2] + CELLSIZE == lockedTiles[i].y) or 
            (self.pivot.x + self.pos[3] == lockedTiles[i].x and
            self.pivot.y + self.pos[4] + CELLSIZE == lockedTiles[i].y) or
            (self.pivot.x + self.pos[5] == lockedTiles[i].x and
            self.pivot.y + self.pos[6] + CELLSIZE == lockedTiles[i].y) or 
            (self.pivot.x + self.pos[7] == lockedTiles[i].x and
            self.pivot.y + self.pos[8] + CELLSIZE == lockedTiles[i].y) then
                return true
        end
    end
    return false
end