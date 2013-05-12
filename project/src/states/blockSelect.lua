Gamestate = require "hump.gamestate"

blockSelect = {}
blockSelect.name = "blockSelect"


function blockSelect:init()
  spawnPlayer()
  map:forceRedraw()
end

function blockSelect:enter(previous)
  blockSelect.prev = previous
end

function blockSelect:update(dt)
  if isGameOver() == true then
    if completedLevels[4] == false then
      completedLevels[curLevel] = true
      curLevel = curLevel + 1
    end
    Gamestate.switch(gameover)
  end
end

function blockSelect:draw()
  drawBoard()
  drawPlaystateExtras()
end

function blockSelect:keypressed(k)

  if k == "w" then
    if player.posX ~= 0 and player.posY ~= 0 then
      blockSelect:move(player.posX, player.posY, player.posX - 1, player.posY - 2)
    end
  end

  if k == "s" then
    if player.posX ~= 0 and player.posY ~= 0 then
      blockSelect:move(player.posX, player.posY, player.posX + 1, player.posY + 2)
    end
  end

  if k == "a" then
    if player.posX ~= 0 and player.posY ~= 0 then
      blockSelect:move(player.posX, player.posY, player.posX - 2, player.posY - 1)
    end
  end

  if k == "d" then
    if player.posX ~= 0 and player.posY ~= 0 then
      blockSelect:move(player.posX, player.posY, player.posX + 2, player.posY + 1)
    end
  end

  -- select starting position
  if k == "return" then
    Gamestate.switch(blockJump, blockSelect)
  end
end

function blockSelect:mousepressed(x, y, button)
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
        Gamestate.switch(play, blockSelect)
      end
    end

    -- level 2
    if x > 601 and x < 617 and y > 23 and y < 39 then
      if curLevel ~= 2 then
        curLevel = 2
        reset()
        Gamestate.switch(play, blockSelect)
      end
    end

    -- level 3
    if x > 583 and x < 599 and y > 41 and y < 57 then
      if curLevel ~= 3 then
        curLevel = 3
        reset()
        Gamestate.switch(play, blockSelect)
      end
    end

    -- level 4
    if x > 601 and x < 617 and y > 41 and y < 57 then
      if curLevel ~= 4 then
        curLevel = 4
        reset()
        Gamestate.switch(play, blockSelect)
      end
    end

  end

end


function blockSelect:move(curX, curY, newX, newY)

  if layer:get(newX, newY) then
    layer:set(curX, curY, tiles[player.curOriginalColor])
      
    player.posX = newX
    player.posY = newY
    
    player.curOriginalColor = layer:get(player.posX, player.posY).properties.color
    layer:set(player.posX, player.posY, tiles["teal"])
    map:forceRedraw()

  end
end
