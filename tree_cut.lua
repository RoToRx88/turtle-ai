--[[Version 1.0]]--

local go_forward = true

function fuelCheck()
  local fuelLevel = turtle.getFuelLevel()
  if fuelLevel < 16 then
    turtle.select(1)
    turtle.refuel(1)
    print("Refueled!")
  end
end

function chopTree()
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
      turtle.digUp()
      turtle.up()
    end
    while turtle.detectDown() == false do
      turtle.down()
    end
  end
end

function perform_rotation()
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

local looping = true
while looping do
  fuelCheck()
  chopTree()
  turtle.forward()
  turtle.forward()
  local ok, data_block = turtle.inspect()
  if data_block.name ~= "minecraft:log" then
    write("No tree detected. 1: perform_rotation; 0: Stop.")
    local what_to_do = tonumber(read())
    if what_to_do == 1 then
      perform_rotation()
      elseif what_to_do == 0 then
        looping = false
      end
  end
end