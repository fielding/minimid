Gamestate = require "hump.gamestate"

paused = {}
paused.name = "paused"


function paused:draw()  
  love.graphics.setColor(0,0,0,180)
  rwrc(20, 110, 600, 120, 40)


  love.graphics.setColor(255,255,255,255)

  love.graphics.setFont(pausedFont)
  love.graphics.print("Paused", 280, 160, 0)
end

function paused:enter(previous)
  previ = previous
  paused.prev = previous
end

--[[function paused:keypressed(k)
  if k == "p" then
    Gamestate.switch(previ)
  end
end
]]