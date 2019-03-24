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
    love.graphics.print(table.concat(sequence, ', '))
    love.graphics.print(current..'/'..#sequence, 0, 20)
    love.graphics.print('sequence[current]: '..sequence[current], 0, 40)
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