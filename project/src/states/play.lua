Gamestate = require "hump.gamestate"

play = {}
play.name = "play"

function play:init()

end


function play:enter(previous)
  play.prev = previous

  level = {
    [1] =  function () layer:set(3, 5, tiles["white"]) end,
    [2] =  function () layer:set(1, 1, tiles["white"]) end,
    [3] =  function () layer:set(2, 3, tiles["white"]) end,
    [4] =  function () layer:set(4, 4, tiles["white"]) end
  }

  level[curLevel]()

  Gamestate.switch(blockSelect, play)
end

function play:draw()

end

function play:update(dt)

end








