function addToSequence()
    table.insert(sequence, love.math.random(4))
end

function love.load()
    sequence = {4, 1, 3, 2, 2, 4}
    addToSequence()
    current = 1
    timer = 0
    state = 'watch'
end

function love.update(dt)
    if state == 'watch' then
        timer = timer + dt
        if timer > 1 then
            timer = 0
            current = current + 1
            if current > #sequence then
                state = 'repeat'
                current = 1
            end
        end
    end
end

function love.draw()
    local function drawSquare(number, colour, highlightedColour)
        local squareSize = 50
        if state == 'watch' and number == sequence[current] then
            love.graphics.setColor(highlightedColour)
        else
            love.graphics.setColor(colour)
        end
        love.graphics.rectangle('fill', squareSize * (number - 1), 0, squareSize, squareSize)
        love.graphics.setColor(1, 1, 1)        
        love.graphics.print(number, squareSize * (number - 1) + 19, 14)
    end
    
    drawSquare(1, { 0.2, 0, 0 }, { 1, 0, 0 })
    drawSquare(2, { 0, 0.2, 0 }, { 0, 1, 0 })
    drawSquare(3, { 0, 0, 0.2 }, { 0, 0, 1 })
    drawSquare(4, { 0.2, 0.2, 0 }, { 1, 1, 0 })

    love.graphics.print(current.. '/' ..#sequence, 20, 60)
    love.graphics.print('sequence[current]: ' .. sequence[current], 20, 100)
    love.graphics.print(table.concat(sequence, ', '), 20, 140)
    love.graphics.print('state: ' .. state, 20, 180)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if state == 'repeat' then
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
end