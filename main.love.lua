// Lua (Love2D game framework)
function love.load()
    message = "Hello, World!"
end

function love.draw()
    love.graphics.print(message, 400, 300)
end

function greet(name)
    return "Hello, " .. name .. "!"
end
