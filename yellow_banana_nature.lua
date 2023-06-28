game

--Mindful Yoga

--Define global constant
YOGA_LENGTH = 2000
YOGA_TIME = 60

--Define Classes 
--Yoga Game class
YogaGame = {}

function YogaGame:new()
  obj = {
    poses = {},
    time = 0
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function YogaGame:addPose(pose)
  table.insert(self.poses, pose)
end

function YogaGame:getTimeRemaining()
  if self.time == 0 then
    return YOGA_TIME
  else
    return self.time
  end
end

function YogaGame:updateTime()
  self.time = self.time - 1
end

--Yoga Pose class
YogaPose = {}

function YogaPose:new()
  obj = {
    poseName = "",
    timeRemaining = 0,
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function YogaPose:setName(name)
  self.poseName = name
end

function YogaPose:getTimeRemaining()
  if self.timeRemaining == 0 then
    return YOGA_LENGTH
  else
    return self.timeRemaining
  end
end

function YogaPose:updateTime()
  self.timeRemaining = self.timeRemaining - 1
end

--Create game
game = YogaGame:new()

--Create poses
warrior1 = YogaPose:new()
warrior1:setName("Warrior 1")

warrior2 = YogaPose:new()
warrior2:setName("Warrior 2")

downwardDog = YogaPose:new()
downwardDog:setName("Downward Dog")

--Add poses to game
game:addPose(warrior1)
game:addPose(warrior2)
game:addPose(downwardDog)

--Main game loop
while game:getTimeRemaining() > 0 do
  for i, pose in ipairs(game.poses) do
    while pose:getTimeRemaining() > 0 do
      pose:updateTime()
    end
  end
  game:updateTime()
end