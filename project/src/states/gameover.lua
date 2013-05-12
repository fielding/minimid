Gamestate = require "hump.gamestate"

gameover = {}
gameover.name = "gameover"

function gameover:draw()

love.graphics.setColor(119,202,162,255)
love.graphics.rectangle("fill", 0, 112, 640, 134)

-- level grid
  -- level 1
  if curLevel == 1 then
    if love.mouse.getX() > 583 and love.mouse.getX() < 599 and love.mouse.getY() > 23 and love.mouse.getY() < 39 then
      love.graphics.setColor(119,202,162,255)
      love.graphics.rectangle("fill", 583, 23, 16, 16)
    else
      love.graphics.setColor(119,202,162,84)
      love.graphics.rectangle("fill", 583, 23, 16, 16)
    end
  elseif completedLevels[1] == true then
      if love.mouse.getX() > 583 and love.mouse.getX() < 599 and love.mouse.getY() > 23 and love.mouse.getY() < 39 then
      love.graphics.setColor(148,119,202,255)
      love.graphics.rectangle("fill", 583, 23, 16, 16)
    else
      love.graphics.setColor(148,119,202,84)
      love.graphics.rectangle("fill", 583, 23, 16, 16)
    end
  else 
    if love.mouse.getX() > 583 and love.mouse.getX() < 599 and love.mouse.getY() > 23 and love.mouse.getY() < 39 then
      love.graphics.setColor(255,255,255,255)
      love.graphics.rectangle("fill", 583, 23, 16, 16)
    else
      love.graphics.setColor(255,255,255,84)
      love.graphics.rectangle("fill", 583, 23, 16, 16)
    end
  end

  -- level 2
  if curLevel == 2 then
    if love.mouse.getX() > 601 and love.mouse.getX() < 617 and love.mouse.getY() > 23 and love.mouse.getY() < 39 then
      love.graphics.setColor(119,202,162,255)  
      love.graphics.rectangle("fill", 601, 23, 16, 16) 
    else
      love.graphics.setColor(119,202,162,84)  
      love.graphics.rectangle("fill", 601, 23, 16, 16) 
    end
  elseif completedLevels[2] == true then
    if love.mouse.getX() > 601 and love.mouse.getX() < 617 and love.mouse.getY() > 23 and love.mouse.getY() < 39 then
      love.graphics.setColor(148,119,202,255)  
      love.graphics.rectangle("fill", 601, 23, 16, 16) 
    else
      love.graphics.setColor(148,119,202,84)  
      love.graphics.rectangle("fill", 601, 23, 16, 16) 
    end
  else
    if love.mouse.getX() > 601 and love.mouse.getX() < 617 and love.mouse.getY() > 23 and love.mouse.getY() < 39 then
      love.graphics.setColor(255,255,255,255)  
      love.graphics.rectangle("fill", 601, 23, 16, 16) 
    else
      love.graphics.setColor(255,255,255,84)  
      love.graphics.rectangle("fill", 601, 23, 16, 16) 
    end
  end

  -- level 3
  if curLevel == 3 then
    if love.mouse.getX() > 583 and love.mouse.getX() < 599 and love.mouse.getY() > 41 and love.mouse.getY() < 57 then
      love.graphics.setColor(119,202,162,255)  
      love.graphics.rectangle("fill", 583, 41, 16, 16)
    else
      love.graphics.setColor(119,202,162,84)  
      love.graphics.rectangle("fill", 583, 41, 16, 16)
    end
  elseif completedLevels[3] == true then
    if love.mouse.getX() > 583 and love.mouse.getX() < 599 and love.mouse.getY() > 41 and love.mouse.getY() < 57 then
      love.graphics.setColor(148,119,202,255)  
      love.graphics.rectangle("fill", 583, 41, 16, 16)
    else
      love.graphics.setColor(148,119,202,84)  
      love.graphics.rectangle("fill", 583, 41, 16, 16)
    end
  else
    if love.mouse.getX() > 583 and love.mouse.getX() < 599 and love.mouse.getY() > 41 and love.mouse.getY() < 57 then
      love.graphics.setColor(255,255,255,255)  
      love.graphics.rectangle("fill", 583, 41, 16, 16)
    else
      love.graphics.setColor(255,255,255,84)  
      love.graphics.rectangle("fill", 583, 41, 16, 16)
    end
  end

  -- level 4 
  if curLevel == 4 then
    if love.mouse.getX() > 601 and love.mouse.getX() < 617 and love.mouse.getY() > 41 and love.mouse.getY() < 57 then
      love.graphics.setColor(119,202,162,255)  
      love.graphics.rectangle("fill", 601, 41, 16, 16)
    else
      love.graphics.setColor(119,202,162,84)  
      love.graphics.rectangle("fill", 601, 41, 16, 16)
    end
    elseif completedLevels[4] == true then
    if love.mouse.getX() > 601 and love.mouse.getX() < 617 and love.mouse.getY() > 41 and love.mouse.getY() < 57 then
      love.graphics.setColor(148,119,202,255)  
      love.graphics.rectangle("fill", 601, 41, 16, 16)
    else
      love.graphics.setColor(148,119,202,84)  
      love.graphics.rectangle("fill", 601, 41, 16, 16)
    end
  else 
    if love.mouse.getX() > 601 and love.mouse.getX() < 617 and love.mouse.getY() > 41 and love.mouse.getY() < 57 then
      love.graphics.setColor(255,255,255,255)  
      love.graphics.rectangle("fill", 601, 41, 16, 16)
    else
      love.graphics.setColor(255,255,255,84)  
      love.graphics.rectangle("fill", 601, 41, 16, 16)
    end
  end


-- nav buttons
-- exit button (548,302) and 569,331)
if love.mouse.getX() > 547 and love.mouse.getX() < 568 and love.mouse.getY() > 301 and love.mouse.getY() < 330 then
  love.graphics.setColor(255,255,255,255)
   love.graphics.draw(exitButton, 547, 301)
else
   love.graphics.setColor(255,255,255,84)
  love.graphics.draw(exitButton, 547, 301)
end

-- next level button (584, 304) and (616, 324)

if love.mouse.getX() > 583 and love.mouse.getX() < 615 and love.mouse.getY() > 303 and love.mouse.getY() < 323 then
  love.graphics.setColor(255,255,255,255)
   love.graphics.draw(nextButton, 583, 303)
else
   love.graphics.setColor(255,255,255,84)
  love.graphics.draw(nextButton, 583, 303)
end

-- text

love.graphics.setColor(255,255,255,255)
love.graphics.setFont(quoteFont)
love.graphics.printf("\“It looks like you can write a minimalist piece without much bleeding. And you can. But not a good one.\”", 60, 162, 329,"right")
love.graphics.setFont(quoteAuthorFont)
love.graphics.print("- David Foster Wallace", 266, 188)

if completedLevels[4] == true then
  love.graphics.setFont(introFont)
  love.graphics.print("You Beat the game!", 405, 158)
else
  love.graphics.setFont(introFont)
  love.graphics.print("Level Cleared!", 448, 158)    
end 

end


function gameover:enter(previous)
  gameover.prev = previous

end


function gameover:keypressed(k)
  if k == "return" then
    reset()
    Gamestate.switch(play, gameover)
  end
end

function gameover:mousepressed(x, y, button)
  if button == 'l' then 

-- next level button (583, 303) and (615, 323)
    if x > 583 and x < 615 and y > 303 and y < 323 then
      reset()
      Gamestate.switch(play, gameover)
    end

-- exit button (547,301) and 568,330)
    if x > 547 and x < 568 and y > 301 and y < 330 then
      reset()
      Gamestate.switch(intro, gameover)
    end
 
  -- level 1
    if x > 583 and x < 599 and y > 23 and y < 39 then
      if curLevel ~= 1 then
        curLevel = 1
        reset()
        Gamestate.switch(play, blockJump)
      end
    end

    -- level 2
    if x > 601 and x < 617 and y > 23 and y < 39 then
      if curLevel ~= 2 then
        curLevel = 2
        reset()
        Gamestate.switch(play, blockJump)
      end
    end

    -- level 3
    if x > 583 and x < 599 and y > 41 and y < 57 then
      if curLevel ~= 3 then
        curLevel = 3
        reset()
        Gamestate.switch(play, blockJump)
      end
    end

    -- level 4
    if x > 601 and x < 617 and y > 41 and y < 57 then
      if curLevel ~= 4 then
        curLevel = 4
        reset()
        Gamestate.switch(play, blockJump)
      end
    end
  end

end
