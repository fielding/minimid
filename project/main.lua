Gamestate = require "hump.gamestate"

-- debug flag
debug = true
debugDisplay = false

function love.load()
  love.graphics.setBackgroundColor(32,32,32)

  audioMuted = false

  -- setup fonts ( avoid having to load these on the fly, especiall in a draw/update call)
  -- menuTitleFont = love.graphics.newFont("assets/font/Comfortaa-Bold.ttf", 24)

  debugFont = love.graphics.newFont("assets/font/Comfortaa-Regular.ttf", 12)
  
  introFont = love.graphics.newFont("assets/font/Comfortaa-Regular.ttf", 24)
  aboutHeaderFont = love.graphics.newFont("assets/font/Comfortaa-Regular.ttf", 30)
  aboutSubtextFont = love.graphics.newFont("assets/font/Comfortaa-Light.ttf", 12)
  aboutFont = love.graphics.newFont("assets/font/Comfortaa-Regular.ttf", 14)
  quoteFont = love.graphics.newFont("assets/font/Comfortaa-Light.ttf", 12)
  quoteAuthorFont = love.graphics.newFont("assets/font/Comfortaa-Bold.ttf", 11)


  -- images used in multiple states
  restartButton = love.graphics.newImage("assets/img/restart.png")
  exitButton = love.graphics.newImage("assets/img/exit.png")
  nextButton = love.graphics.newImage("assets/img/next.png")
  soundOn = love.graphics.newImage("assets/img/soundOn.png")
  soundOff = love.graphics.newImage("assets/img/soundOff.png")

  -- menu/function states
  require("src/states/intro")
  require("src/states/about")
  require("src/states/paused")
  require("src/states/menu")
  require("src/states/gameover")
  require("src/states/play")

    -- play substates
  require("src/states/blockSelect")
  require("src/states/blockJump")

    -- create tile loader
  loader = require "Advanced-Tiled-Loader/Loader"
  -- set the path to the Tiled map files
  loader.path = "assets/map/"

  -- load the current map
  map = loader.load("board.tmx")
  layer = map("board")

  -- get info about available tileset

  tiles = {}

  for id, tile in pairs(map.tiles) do
    if tile.properties.color then
      tiles[tile.properties.color] = tile
    end
  end
  
  -- setup the player
  player = { posX = 0, posY = 0, curOriginalColor = "purple" }

  -- set default level to 1
  curLevel = 1
  completedLevels = {false, false, false, false}

  -- register callbacks for Gamestate, and move to the initial gamestate
  Gamestate.registerEvents()
  Gamestate.switch(intro)

end

function love.update(dt)
  -- gamewide input configuration
  handleInput(dt)
end


function love.draw()
  --love.graphics.setColor(0, 0, 0, 255)

  if debugDisplay == true then
    debugOverlay()
  end
end

function reset()

-- reload the map
map = loader.load("board.tmx")
layer = map("board")

-- reset the player position/info
player.posX = 0
player.posY = 0
player.curOriginalColor = "purple"

-- spawn new player
spawnPlayer()

end

function debugOverlay()
  -- create the overlay (rounded rectangle)
  love.graphics.setColor(0,0,0,180)
  rwrc(5, 5, 150, 350, 20)

  local current = Gamestate.getCurrent()

  local prev = current.prev or "None"

  if audioMuted == true then
    audioStatus = "Muted"
  elseif audioMuted == false then
    audioStatus = "Playing"
  end

  -- information to print
  local information = {
  "ld48 #26 Debug", " ",
  "Gamestate Info: ", "Current: "..current.name, "Prev: "..prev.name, " ", 
  "FPS: "..love.timer.getFPS(), " ", 
  "Mouse Location:", "X: "..love.mouse.getX(), "Y: "..love.mouse.getY()," ",
  "Audio Status: "..audioStatus}

  -- setup the font and print everything in the information table
  love.graphics.setColor(255,255,255,255)
  love.graphics.setFont(debugFont)

  for i=1, #information do
    love.graphics.print(information[i], 12, (i-1)*13 + 10)
  end



end

function love.keypressed(k)

  -- menu
  if k == 'escape' then
    
    if Gamestate.getCurrent() == intro then
      love.event.quit()
      --Gamestate.switch(prev, Gamestate.getCurrent())
    else
      Gamestate.switch(intro, Gamestate.getCurrent())
    end
    
    --[[ Disabling Menu for now
    if Gamestate.getCurrent() == menu then
      Gamestate.switch(previ, Gamestate.getCurrent())
    else
      Gamestate.switch(menu, Gamestate.getCurrent())
    end
    ]]

  end

  -- pause
  --[[ Diabling pause for the time being, turns out I didn't need it
  if k == "p" then
    if Gamestate.getCurrent() == paused then
      Gamestate.switch(previ, Gamestate.getCurrent())
    else  
      Gamestate.switch(paused, Gamestate.getCurrent())
    end
  end
  ]]

  if debug == true then
    if k == "`" then
      if debugDisplay == false then
        debugDisplay = true
      else
        debugDisplay = false
      end
    end
    
    if k == "g" then
      Gamestate.switch(gameover, Gamestate.getCurrent())
    end

    if k == "l" then
      if curLevel < 4 then
        curLevel = curLevel + 1
        completedLevels[curLevel] = true
      end
    end
  end

end

-- skeleton in case I need later

function handleInput(dt)

  if love.keyboard.isDown("left") then

  end

  if love.keyboard.isDown("left") then

  end

  if love.keyboard.isDown("left") then

  end

end

-- rounded rectangle function

function rwrc(x, y, w, h, r)
  local right = 0
  local left = math.pi
  local bottom = math.pi * 0.5
  local top = math.pi * 1.5
  r = r or 15
  love.graphics.rectangle("fill", x, y+r, w, h-r*2)
  love.graphics.rectangle("fill", x+r, y, w-r*2, r)
  love.graphics.rectangle("fill", x+r, y+h-r, w-r*2, r)
  love.graphics.arc("fill", x+r, y+r, r, left, top)
  love.graphics.arc("fill", x + w-r, y+r, r, -bottom, right)
  love.graphics.arc("fill", x + w-r, y + h-r, r, right, bottom)
  love.graphics.arc("fill", x+r, y + h-r, r, bottom, left)
end

function drawBoard()

  love.graphics.push()
  local tx = 32
  local ty = 57
  local scale = 1

  love.graphics.translate(tx, ty)
  love.graphics.scale(scale)

  love.graphics.setColor(255,255,255,255)
  map:draw()
  love.graphics.pop()
end

function drawPlaystateExtras()
  
  -- current level display
  love.graphics.setColor(255,255,255)
  love.graphics.setFont(aboutHeaderFont)
  love.graphics.print("Level "..curLevel, 463, 29)

  -- level switch grid

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

  -- reset level button
  if love.mouse.getX() > 587 and love.mouse.getX() < 610 and love.mouse.getY() > 76 and love.mouse.getY() < 102 then
    love.graphics.setColor(255,255,255, 255)
    love.graphics.draw(restartButton, 587, 76)
  else
    love.graphics.setColor(255,255,255,84)
    love.graphics.draw(restartButton, 587, 76)
  end

  -- exit button
  if love.mouse.getX() > 589 and love.mouse.getX() < 610 and love.mouse.getY() > 121 and love.mouse.getY() < 150 then
    love.graphics.setColor(255,255,255,255)
    love.graphics.draw(exitButton, 589, 121)
  else
    love.graphics.setColor(255,255,255,84)
    love.graphics.draw(exitButton, 589, 121)
  end
  
  -- mute sound
  if love.mouse.getX() > 592 and love.mouse.getX() < 608 and love.mouse.getY() > 166 and love.mouse.getY() < 199 then
    love.graphics.setColor(255,255,255,255)
    if audioMuted == false then
      love.graphics.draw(soundOn, 592, 166)
    elseif audioMuted == true then
      love.graphics.draw(soundOff, 589, 166)
    end
  else
    love.graphics.setColor(255,255,255,84)
    if audioMuted == false then
      love.graphics.draw(soundOn, 592, 166)
    elseif audioMuted == true then
      love.graphics.draw(soundOff, 589, 166)
    end
  end

end

function spawnPlayer()

  if ( curLevel == 4 ) then
    layer:set(1, 1, tiles["teal"])
  
    player.posX = 1
    player.posY = 1

  else
    layer:set(4, 4, tiles["teal"])
  
    player.posX = 4
    player.posY = 4
  end
end

function isGameOver()
  
  local count = 0
  -- check all blocks on the map/layer to see how many purple blocks are left
  for x, y, tile in layer:iterate() do
    if tile.properties.color == "purple" then
      if count < 4 then
        count = count + 1
      end
    end
  end

  if count < 1 then
    return true
  end

  return false
end
