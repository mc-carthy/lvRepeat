function addToSequence()
    table.insert(sequence, love.math.random(4))
end

function love.load()
    sequence = {}
    addToSequence()
    current = 1
end

function love.update(dt)

end

function love.draw()
    local function drawSquare(number, color)
        local squareSize = 50
        love.graphics.setColor(color)
        love.graphics.rectangle('fill', squareSize * (number - 1), 0, squareSize, squareSize)
        love.graphics.setColor(1, 1, 1)        
        love.graphics.print(number, squareSize * (number - 1) + 19, 14)
    end
    
    drawSquare(1, { 0.2, 0, 0 })
    drawSquare(2, { 0, 0.2, 0 })
    drawSquare(3, { 0, 0, 0.2 })
    drawSquare(4, { 0.2, 0.2, 0 })

    love.graphics.print(current..'/'..#sequence, 20, 60)
    love.graphics.print('sequence[current]: '..sequence[current], 20, 100)
    love.graphics.print(table.concat(sequence, ', '), 20, 140)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if tonumber(key) == sequence[current] then
        current = current + 1
        if current > #sequence then
            current = 1
            addToSequence()
        end
    else
        love.load()
    end
end