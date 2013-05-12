Gamestate = require "hump.gamestate"

menu = {}
menu.name = "menu"

function menu:enter(previous)

  previ = previous
  menu.prev = previous

end

function menu:draw()  
  love.graphics.setColor(0,0,0,180)
  -- rwrc(x, y, w, h, r)
  rwrc(230, 10, 180, 340, 40)

  love.graphics.setColor(255,255,255,255)

  love.graphics.setFont(menuTitleFont)
  love.graphics.print("Menu", 280, 20, 0)
  love.graphics.print("1: restart",260, 60, 0)

end

function menu:keypressed(k)

  if k == "1" then
    reset()
    Gamestate.switch(play, menu)
  end
end



