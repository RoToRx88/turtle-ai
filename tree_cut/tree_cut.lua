local go_forward = true
local looping = true

function fuelCheck()
  print("Checking fuel.")
  local fuelLevel = turtle.getFuelLevel()
  if fuelLevel < 16 then
    turtle.select(1)
    turtle.refuel(1)
    print("Refueled!")
  end
end

function chopTree()
  print("ChopTree()")
  local success, data = turtle.inspect()
  if data.name == "minecraft:log" then
    print("Tree detected.")
    turtle.dig()
    turtle.forward()
    turtle.digDown()
    turtle.select(3)
    turtle.placeDown()
    turtle.select(1)
    while turtle.detectUp() == true do
      success, data = turtle.inspectUp()
      if data.name ~= "minecraft:log" then
        break
      else
       turtle.digUp()
       turtle.up()
      end
    end
    while turtle.detectDown() == false do
      turtle.down()
    end
    success, data = turtle.inspectDown()
    if data.name == "minecraft:dirt" then
      turtle.up()
    end
  end
end

function perform_rotation()
  print("perform_rotation now running")
  if go_forward then
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.turnLeft()
    go_forward = false  
  elseif not go_forward then
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.forward()
    turtle.turnRight() 
    go_forward = true
  end
end

function back_home()
  turtle.turnLeft()
  local s_front, d_front = turtle.inspect()
  if d_front.name == "minecraft:leaves" then
    turtle.dig()
  end
  turnLeft.forward()
  turtle.turnRight()
  for i = 1, 7 do
  s_front, d_front = turtle.inspect()
  if d_front.name == "minecraft:leaves" then
    turtle.dig()
  end
    turtle.forward()
  end
  turtle.turnLeft()
  for i = 1, 13 do
  s_front, d_front = turtle.inspect()
  if d_front.name == "minecraft:leaves" then
    turtle.dig()
  end
    turtle.forward()
  end
  turtle.turnLeft()
end

while looping do
  fuelCheck()
  chopTree()
  turtle.forward()
  turtle.forward()
  turtle.forward()
  local s_front, d_front = turtle.inspect()
  if d_front.name == "minecraft:leaves" then
    print("Digging leaves")
    turtle.dig()
  elseif d_front.name == "minecraft:stone" then
    print("Wall detected, rotating")
    perform_rotation()
  elseif d_front.name == "minecraft:cobblestone" then
    back_home()
  end
--[[  local s_down, d_down = turtle.inspectDown()
  if d_down.name ~= "minecraft:sapling" then
    print("No sapling found. Rotate to clean next line")
    perform_rotation()
  end]]--
end