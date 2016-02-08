LWOG = {};

function LWOG.new()
	local self = {};

	local position_x = 0;
	local position_y = 0;
	local position_z = 0;
	
	local heading = 0;

	function self.updatePosition(order)
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

	function self.forward(how_much)
		for i = 1, how_much do
			turtle.forward();
			self.updatePosition("forward");
		end
	end

	function self.back(how_much)
		for i = 1, how_much do
			turtle.back();
			self.updatePosition("back");
		end
	end

	function self.up(how_much)
		for i = 1, how_much do
			turtle.up();
			self.updatePosition("up");
		end
	end

	function self.down(how_much)
		for i = 1, how_much do
			turtle.down();
			self.updatePosition("down");
		end
	end

	function self.turnLeft(how_much)
		for i = 1, how_much do
			turtle.turnLeft();
			self.updatePosition("turnLeft");
		end
	end

	function self.turnRight(how_much)
		for i = 1, how_much do
			turtle.turnRight();
			self.updatePosition("turnRight");
		end
	end

	function self.getPosition()
		print("x:", position_x, " y:", position_y, " z:", position_z);
		print("orientation: ", heading);
	end

	return self;
end

--[Test to debug and synthax, remove befose use]--
local toto = LWOG.new();
toto.forward(2);
toto.getPosition();
toto.turnLeft(2);
toto.getPosition();
toto.forward(2);
toto.getPosition();
