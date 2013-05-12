Gamestate = require "hump.gamestate"

about = {}
about.name = "about"

function about:init()

end

function about:enter(previous)
  about.prev = previous
end

function about:update(dt)

end

function about:draw()
  love.graphics.setColor(255,255,255,255)

  -- About
  -- minimid v0.1
  
  love.graphics.setColor(119, 202, 162)
  love.graphics.rectangle("fill", 563, 22, 10, 10)
  love.graphics.setColor(148, 119, 202)
  love.graphics.rectangle("fill", 563, 35, 10, 10)
  love.graphics.setColor(244, 244, 244)
  love.graphics.rectangle("fill", 563, 48, 10, 10)

  love.graphics.setColor(255,255,255)
  love.graphics.setFont(aboutHeaderFont)
  love.graphics.print("about", 478, 20)

  love.graphics.setFont(aboutSubtextFont)
  love.graphics.print("minimid v0.1", 490, 48)

  love.graphics.setFont(aboutFont)

  -- This game is my entry for ludum dare #26. The theme was minimalism,
  -- which I tried to embrace in both aesthetic elements and the goal of
  -- the puzzle. Each level is about removing blocks, which represnents the
  -- idea of decluttering, or stripping away superfluous things.

  love.graphics.printf("This game is my entry for ludum dare #26. The theme was minimalism, which I tried to embrace in both aesthetic elements and the goal of the puzzle. Each level is about removing blocks, which represnents the idea of decluttering, or stripping away superfluous things.", 25, 90, 363, "right")
  
  -- This was my first attempt using the Löve framework, and also my first
  -- few days of learning the lua scripting language. I had a lot of fun, and
  -- most important learned a lot. 

  love.graphics.printf("This was my first attempt using the Löve framework, and also my first few days of learning the lua scripting language. I had a lot of fun, and most important learned a lot.", 25, 203, 363, "right")
  
  -- Game Design, Programming, 
  -- Art, Music, Sound Effects

  love.graphics.setColor(168,168,168)
  love.graphics.print("Game Design, Programming,", 402, 90)
  love.graphics.print("Art, Music, Sound Effcts", 438, 106)

  -- Fielding Johnston
  -- justfielding.com

  love.graphics.setColor(255,255,255)
  love.graphics.print("Fielding Johnston", 478, 123)
  love.graphics.print("justfielding.com", 492, 140)

  -- Special thanks to

  love.graphics.setColor(168,168,168)
  love.graphics.print("Special thanks to", 483, 180)

  -- ludumdare.com
  -- Love2d.org
  -- Jeffrey Carpenter
  -- Mom

  love.graphics.setColor(255,255,255)
  love.graphics.print("ludumdare.com", 491, 196)
  love.graphics.print("Love2d.org", 522, 211)
  love.graphics.print("Jeffrey Carpenter", 472, 225)
  love.graphics.print("Mom", 567, 240)

  love.graphics.setFont(introFont)
  love.graphics.print("back", 526, 299)

  love.graphics.setColor(119, 202, 162)
  love.graphics.rectangle("fill", 509, 307, 10, 10)



end

function about:keypressed(k)

  if k == "return" then
    Gamestate.switch(intro, about)
  end

end

function about:mousepressed(x, y, button)
  if button == 'l' then
    -- back button bounds: 509x to 583x, 302y to 321y
    if x > 509 and x < 583 and y > 302 and y < 321 then
      Gamestate.switch(intro, about)
    end 

  end
end