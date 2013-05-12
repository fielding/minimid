Gamestate = require "hump.gamestate"

blockJump = {}
blockJump.name = "blockJump"

function blockJump:enter(previous)
blockJump.prev = previous
end

function blockJump:update(dt)
  if isGameOver() == true then
    if completedLevels[4] == false then
      completedLevels[curLevel] = true
      curLevel = curLevel + 1
    end
    Gamestate.switch(gameover)
  end
end

function blockJump:draw()
  drawBoard()
  drawPlaystateExtras()
end

function blockJump:keypressed(k)

  if k == "w" then
      blockJump:move(player.posX, player.posY, player.posX - 2, player.posY - 4)
  end

  if k == "s" then
      blockJump:move(player.posX, player.posY, player.posX + 2, player.posY + 4)
  end

  if k == "a" then
      blockJump:move(player.posX, player.posY, player.posX - 4, player.posY - 2)
  end

  if k == "d" then
      blockJump:move(player.posX, player.posY, player.posX + 4, player.posY + 2)
  end

  if k == "q" then
    blockJump:move(player.posX, player.posY, player.posX - 2 , player.posY + 2)
  end

  if k == "e" then
    blockJump:move(player.posX, player.posY, player.posX + 2 , player.posY - 2)
  end


  if k == "return" then
    Gamestate.switch(blockSelect, blockJump)
  end
end

function blockJump:mousepressed(x, y, button)
  if button == 'l' then 
    if x > 586 and x < 610 and y > 76 and y < 102 then
      reset()
      Gamestate.switch(play, blockSelect)
    end

    if x > 589 and x < 610 and y > 121 and y < 150 then
      reset()
      Gamestate.switch(intro, blockSelect)
    end

    if x > 592 and x < 608 and y > 166 and y < 199 then
      if audioMuted == false then
        love.audio.stop()
        audioMuted = true
      elseif audioMuted == true then
        audioMuted = false
      end
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


function blockJump:move(curX, curY, newX, newY)
  
  remX = ( ( newX - player.posX ) / 2 ) + player.posX
  remY = ( ( newY - player.posY ) / 2 ) + player.posY

  if layer:get(newX, newY) then

    if layer:get(newX, newY).properties.color == "white" and
      layer:get(remX, remY).properties.color == "purple" and
      player.curOriginalColor == "purple" then
      
      -- set current to empty since we are moving the block from it
      layer:set(curX, curY, tiles["white"])

      -- change the color of the block that we are jumping over



      layer:set(remX, remY, tiles["white"])

      player.posX = newX
      player.posY = newY

      layer:set(player.posX, player.posY, tiles["teal"])
      
      -- redraw the map to reflect changes
      map:forceRedraw()

      Gamestate.switch(blockSelect)
    end
  end


end
