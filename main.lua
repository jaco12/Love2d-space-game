
--Imports
function love.load()
	mainTheme = love.audio.newSource("URMUM.mp3", "static")
	weaponsRoom = love.graphics.newImage("Weapons_room.png")
	int=2
	player = love.graphics.newImage("Astronaut.png")
	hall = love.graphics.newImage("Basic_tile_left_right.png")
	engineRoom = love.graphics.newImage("Engine_room_damaged.png")
	interact = love.graphics.newImage("New_piskel.png")
	captain = love.graphics.newImage("New_piskel_2.png")
	--110*110
--vars
	time=love.timer.getTime()
	x=0
	y=0
	speed = 130
	bitfont = love.graphics.newFont("8-bit.ttf")
	playable=false
	room ="menu"
	nextscene = 0
		-- shitty temporary fix, maybe replace it later?
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

--every frame
function love.update(dt)
	love.audio.play(mainTheme)
		if playable == true then
			if love.keyboard.isDown('right') then
	      x = x + (speed * dt)
			elseif love.keyboard.isDown('left') then
				x = x - (speed * dt)
			elseif love.keyboard.isDown('down') then
				y=y+(speed*dt)
			elseif love.keyboard.isDown('up') then
				y=y-(speed*dt)
		end

		if room == "weapons bay" then
			if CheckCollision(x+350,y+300,110,110,800,0,5,600)then
				x= x-(speed*dt)
			end
			if CheckCollision(x+350,y+300,110,110,0,600,800,5)then
				y= y-(speed*dt)
			end
			if CheckCollision(x+350,y+300,110,110,0,0,5,600)then

			end
			if CheckCollision(x+350,y+300,110,110,0,0,800,5)then
				y= y+(speed*dt)
			end
			if CheckCollision(x+350,y+300,110,110,0,230,80,110)then
				room = "hallway"
				x=690 y= 250
			end
		end
end
end

function love.keyreleased(key)
		if key == "return" and room == "menu" then
			room = "expositionone"
		end
		if key == "return" and room == "expositionone" and nextscene == 1 then
			room = "weapons bay"
		end
end

function love.draw()
	if room=="menu" then
		love.graphics.draw(love.graphics.newText(bitfont, "ARTHAS"), 280 , 230,0,2,2)
		love.graphics.draw(love.graphics.newText(bitfont, "Press enter to start"),287 , 300,0,1,1)
	elseif room=="expositionone" then
		love.graphics.draw(love.graphics.newText(bitfont, "You wake up in the weapons bay. Everything was a blur to you at first when the memory of"),0,70,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "the attack came rushing back to you. You remember that you and your friends were initially"),0,90,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, " going to the escape pods however the three of you split up when you saw a group of "),0,110,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "pirates heading in your direction. You ran to the weapons bay in hopes of finding "),0,130,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "a place to hide only to trip on a small crate and hit your head on the floor, "),0,150,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "knocking you out. Pulling out your communicator, you try to contact the first and 2nd "),0,170,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "engineer but all you heard was static on their end. Realizing that your friends are "),0,190,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont,"missing, you get on your feet and set your goal on finding a way off the ship. "),0,210,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont,"From what you can tell based on the condition of the ship, you were unconscious "),0,230,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont,"for at least a couple of hours which means you don’t have a lot of time left to "),0,250,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont,"find a functioning escape pod before the ship is completely destroyed."),0,270,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, " Press enter to continue "),0,310,0,1.4,1.4)
		nextscene = 1
	elseif room == "weapons bay" then
			playable=true
			love.graphics.draw(weaponsRoom, 0,0)
			love.graphics.draw(player, x+350, y+300)
	elseif room == "hallway" then
		playable=true
		love.graphics.draw(hall,0,0)
		love.graphics.draw(player, x, y)
	end
end
