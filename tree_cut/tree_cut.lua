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
      turtle.digUp()
      turtle.up()
    end
    while turtle.detectDown() == false do
      turtle.down()
    end
    local s_end, d_end = turtle.inspect()
    if d_end.name == "minecraft:cobblestone" then
      looping = false
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

while looping do
  fuelCheck()
  chopTree()
  turtle.forward()
  turtle.forward()
  turtle.forward()
  local s_down, d_down = turtle.inspectDown()
  if d_down.name ~= "minecraft:sapling" then
    print("No sapling found. Rotate to clean next line")
    perform_rotation()
  end
  local s_front, d_front = turtle.inspect()
  if d_front.name == "minecraft:leaves" then
    print("Digging leaves")
    turtle.dig()
  end
end