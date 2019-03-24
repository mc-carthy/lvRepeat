function love.load()
    sequence = {4, 3, 1, 2, 2, 4}
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
        end
    end
end