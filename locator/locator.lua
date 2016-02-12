LWOG = {};

function LWOG.new() --[[LWOG for Location WithOut GPS]]--
	local self = {};

--[[
All the positions and the heading are relative to the initial position of the turtle when the LWOG is initialized and not necessary match with the minecraft coordinate / GPS system of computercraft
]]--

	local position_x = 0;
	local position_y = 0;
	local position_z = 0;
	
	local heading = 0; --[[Heading relative from the initial heading. 0: front; 1: right; 2: behind; 3: left]]--

	function self.updatePosition(order) --[[Keep in mind that the heading determine if we are "really" going forward or not in the relative environment]]--
		if (order == "forward") then
			if (heading == 0) then
				position_x = position_x + 1;
			elseif (heading == 1) then
				position_y = position_y + 1;
			elseif (heading == 2) then
				position_x = position_x - 1;
			elseif (heading == 3) then
				position_y = position_y - 1;
			else
				write("Wrong self.heading")
			end
		elseif (order == "back") then
			if (heading == 0) then
				position_x = position_x - 1;
			elseif (heading == 1) then
				position_y = position_y - 1;
			elseif (heading == 2) then
				position_x = position_x + 1;
			elseif (heading == 3) then
				position_y = position_y + 1;
			else
				write("Wrong self.heading")
			end
		elseif (order == "up") then
			position_z = position_z + 1;
		elseif (order == "down") then
			position_z = position_z - 1;
		elseif (order == "turnLeft") then
			if (heading == 0) then
				heading = 3;
			else
				heading = heading - 1;
			end
		elseif (order == "turnRight") then
			if (heading == 3) then
				heading = 0;
			else
				heading = heading + 1;
			end
		end
	end

--[[All moving functions give a parameter called "how_much" to allow you to call just one time forward to travel 100 blocks for example. just call LWOG.forward(100)]]--
	function self.forward(how_much)
		if (how_much <= 0) then
			print("Don't move.");
		end
		for i = 1, how_much do
			turtle.forward();
			self.updatePosition("forward");
		end
	end

	function self.back(how_much)
		if (how_much <= 0) then
			print("Don't move.");
		end
		for i = 1, how_much do
			turtle.back();
			self.updatePosition("back");
		end
	end

	function self.up(how_much)
		if (how_much <= 0) then
			print("Don't move.");
		end
		for i = 1, how_much do
			turtle.up();
			self.updatePosition("up");
		end
	end

	function self.down(how_much)
		if (how_much <= 0) then
			print("Don't move.");
		end
		for i = 1, how_much do
			turtle.down();
			self.updatePosition("down");
		end
	end

	function self.turnLeft(how_much)
		if (how_much <= 0) then
			print("Don't move.");
		end
		for i = 1, how_much do
			turtle.turnLeft();
			self.updatePosition("turnLeft");
		end
	end

	function self.turnRight(how_much)
		if (how_much <= 0) then
			print("Don't move.");
		end
		for i = 1, how_much do
			turtle.turnRight();
			self.updatePosition("turnRight");
		end
	end

	function self.printPosition()
		print("x:", position_x, " y:", position_y, " z:", position_z);
		print("orientation: ", heading);
	end

	function self.getPosition()
		return (position_x, position_y, position_z);
	end

	function self.goToX(dest)
		local distance = dest - position_x;
		if (distance == 0) then
			print("[ ERROR  ] goToX: nil distance");
		elseif (distance > 0) then
			while (heading ~= 0) do
				turnRight(1);
			end
		elseif (distance < 0) then
			distance = distance * -1;
				while (heading ~= 2) do
					turnRight(1);
				end
		end
		forward(distance);
	end

	function self.goToX(dest)
		local distance = dest - position_x;
		if (distance == 0) then
			print("[ ERROR  ] goToX: nil distance");
		elseif (distance > 0) then
			while (heading ~= 0) do
				turnRight(1);
			end
		elseif (distance < 0) then
			distance = distance * -1;
				while (heading ~= 2) do
					turnRight(1);
				end
		end
		forward(distance);
	end

	function self.goToY(dest)
		local distance = dest - position_y;
		if (distance == 0) then
			print("[ ERROR  ] goToY: nil distance");
		elseif (distance > 0) then
			while (heading ~= 1) do
				turnRight(1);
			end
		elseif (distance < 0) then
			distance = distance * -1;
				while (heading ~= 1) do
					turnRight(1);
				end
		end
		forward(distance);
	end

	function self.goTo(destX, destY)
		goToX(destX);
		goToY(destY);
	end

	return self;
end

--[[Test to debug and synthax; TODO: remove befose use]]--
local toto = LWOG.new();
toto.forward(2);
toto.printPosition();
toto.turnLeft(2);
toto.printPosition();
toto.forward(2);
toto.printPosition();
