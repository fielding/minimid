Gamestate = require "hump.gamestate"

intro = {}
intro.name = "intro"

function intro:init()
  logo = love.graphics.newImage("assets/img/logo.png")

  menuSelect = { position = 1, x = 509, y = 204 }

end

function intro:enter(previous)
  if previous.name == nil then
    intro.prev = {}
    intro.prev.name = "None"
  else
    intro.prev = previous
  end
end

function intro:update()

  if love.mouse.getX() > 509 and love.mouse.getX() < 582 and love.mouse.getY() > 197 and love.mouse.getY() < 216 then
    
    if menuSelect.position == 2 then
      menuSelect.position = 1
      menuSelect.y = menuSelect.y - 34
    end

  end

  if love.mouse.getX() > 509 and love.mouse.getX() < 594 and love.mouse.getY() > 231 and love.mouse.getY() < 250 then 
    if menuSelect.position == 1 then   
      menuSelect.position = 2
      menuSelect.y = menuSelect.y + 34
    end
  end
end

function intro:draw()
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(logo, 388, 116)

  love.graphics.setColor(255,255,255,255)
  love.graphics.setFont(quoteFont)
  love.graphics.printf("\“Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.\”", 14, 115, 351, "right")
  love.graphics.setColor(119, 202, 162)
  love.graphics.setFont(quoteAuthorFont)
  love.graphics.print("- Antoine de Saint-Exupe", 229, 141)


  love.graphics.setFont(introFont)
  love.graphics.print("start", 527, 194) 
  love.graphics.print("about", 527, 228)  -- 34 below start
  
  love.graphics.setColor(119, 202, 162, 255)
  love.graphics.rectangle("fill", menuSelect.x, menuSelect.y, 10, 10) -- start is at (509, 204), about is at (509, 238)
end



function intro:keypressed(k)
  if k == 'return' then
    if     menuSelect.position == 1 then Gamestate.switch(play, intro)
    elseif menuSelect.position == 2 then Gamestate.switch(about, intro)
    end
  end

  if k == 'up' then
    
    if menuSelect.position == 2 then
      menuSelect.position = 1
      menuSelect.y = menuSelect.y - 34
    end

  end

  if k == 'down' then
    
    if menuSelect.position == 1 then
      menuSelect.position = 2
      menuSelect.y = menuSelect.y + 34
    end

  end

end


function intro:mousepressed(x, y, button)
  if button == 'l' then
    -- start button bounds: 509x to 582x, 197y to 216y
    if x > 509 and x < 582 and y > 197 and y < 216 then
      Gamestate.switch(play, intro)
    end 

    -- about button bounds: 509x to ~594x, 231y to 250y
    if x > 509 and x < 594 and y > 231 and y < 250 then 
      Gamestate.switch(about, intro)
    end

  end
end