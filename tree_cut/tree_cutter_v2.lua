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
    if data.name == "minecraft:oak_log" then
        print("Tree detected.")
        turtle.dig()
        turtle.forward()
        turtle.digDown()
        turtle.select(2)
        turtle.placeDown()
        turtle.select(1)
        while turtle.detectUp() == true do
            success, data = turtle.inspectUp()
            if data.name ~= "minecraft:oak_log" then
                break
            else
                turtle.digUp()
                turtle.up()
            end
        end
        while turtle.detectDown() == false do turtle.down() end
        success, data = turtle.inspectDown()
        if data.name == "minecraft:dirt" then turtle.up() end
    end
end

function MoveUntilTreeOrEnd()
    local s_front, d_front = turtle.inspect()

    while d_front.name ~= "minecraft:cobblestone"
    and d_front.name ~= "minecraft:oak_log"
    and d_front.name ~= "minecraft:lapis_block" do

        if d_front.name == "minecraft:oak_leaves" then turtle.dig() end
        turtle.forward()
        fuelCheck()
        s_front, d_front = turtle.inspect()
        
    end
    return d_front
end

function PerformUTurn()
    if go_forward then
        turtle.turnLeft()
        local d_front = MoveUntilTreeOrEnd()
        turtle.turnLeft()
    elseif not go_forward then
        turtle.turnRight()
        local d_front = MoveUntilTreeOrEnd()
        turtle.turnRight()
    end
    go_forward = not go_forward
end

while looping do
    fuelCheck()
    local d_front = MoveUntilTreeOrEnd()
    if d_front.name == "minecraft:oak_log" then
        chopTree()
    elseif d_front.name == "minecraft:cobblestone" then
        PerformUTurn()
    elseif d_front.name == "minecraft:lapis_block" then
        looping = false
        turtle.turnLeft()
        turtle.digUp()
        turtle.up()
        local d_front = MoveUntilTreeOrEnd()
        turtle.digDown()
        turtle.down()
        turtle.turnLeft()
    end
end
