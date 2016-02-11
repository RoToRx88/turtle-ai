write("x (front) :")
local size_x = tonumber(read())
write("y (right) : ")
local size_y = tonumber(read())
write("z (top) : ")
local size_z = tonumber(read())

function fuelCheck()
  local fuelLevel = turtle.getFuelLevel()
  if fuelLevel < 16 then
    turtle.select(1)
    turtle.refuel(1)
    print("Refueled!")
  end
end

for z = 1, size_z do
	local go_forward = true

	for i = 1, size_y do
		for x = 1, size_x - 1 do
			fuelCheck()
			turtle.dig()
			turtle.forward()
		end
		if (go_forward and i < size_y) then
			turtle.turnRight()
			turtle.dig()
			turtle.forward()
			turtle.turnRight()
			go_forward = false
		elseif (not go_forward and i < size_y) then
			turtle.turnLeft()
			turtle.dig()
			turtle.forward()
			turtle.turnLeft()
			go_forward = true
		end
	end
	if (go_forward) then
		turtle.turnRight()
		turtle.turnRight()
		for i = 2, size_x  do
			turtle.forward()
		end
		turtle.turnRight()
		for i = 2, size_y do
			turtle.forward()
		end
		turtle.turnRight()
	elseif (not go_forward) then
		go_forward = true
		turtle.turnRight()
		for i = 2, size_y do
			turtle.forward()
		end
		turtle.turnRight()
	end
	if (z < size_z) then
		turtle.digUp()
		turtle.up()
	else
		for z_back_home = 2, size_z do
			turtle.down()
		end
	end
end