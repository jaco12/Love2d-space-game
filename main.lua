
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
	keycard = love.graphics.newImage("New_Piskel_3")
	--110*110

--vars
	time=love.timer.getTime()
	x=0
	y=0
	journal=true
	speed = 400--130
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
				y = y + (speed*dt)
			elseif love.keyboard.isDown('up') then
				y = y - (speed*dt)
		end
	end
	if playable == true then
		if CheckCollision(x,y,110,110,698,0,2,600) then
				x = x-(speed*dt)
		end
		-- ^right of screen boundary
		if CheckCollision(x,y,110,110,0,0,2,600) then
			x = x+(speed*dt)
		end
		-- ^left of screen boundary

		if CheckCollision(x,y,110,110,0,0,700,2) then
			y = y+(speed*dt)
		end
		-- ^top of screen boundary

		if CheckCollision(x,y,110,110,0,598,700,2)then
			y = y-(speed*dt)
		end
		-- ^bottom of screen boundary
end
		if room == "weapons bay" then
			if CheckCollision(x,y,110,110,6,250,1,100)then
				room = "hallway1"
				x=500
				y=234
			-- weapons bay to hallway detection (left side)
			end
		end

		if room == "hallway1" then

			if CheckCollision(x,y,110,110,690,250,1,100)then
				room = "weapons bay"
				x=150
				y=234
			-- hallway to weapons bay detection (right side)
			end
			if CheckCollision(x,y,110,110,200,400,50,50)and journal==true then
				room = "journal"
			-- journal exposition
			end
			if CheckCollision(x,y,110,110,17,250,1,100)then
				room = "hallway2"
				x=500
				y=234
		-- to next hall left
			end
		end
		if room == "hallway2" then
			if CheckCollision(x,y,110,110,690,250,1,100)then
				room = "hallway1"
				x=150
				y=234
			-- to previuos hall right
			end
		if CheckCollision(x,y,110,110,270,15,100,15)then
			room = "hallway3"
			x=300
			y=460
		-- to next hall up
		end
	end
			if room == "hallway3" then
					if CheckCollision(x,y,110,110,690,250,1,100)then
						room = "hallway6"
						x=150
						y=234
						--goal right side
					end
					if CheckCollision(x,y,110,110,17,250,1,100)then
						room = "hallway4"
						x=450
						y=234
				-- to next hall left
					end
					if CheckCollision(x,y,110,110,270,15,100,15)then
						room = "hallway5"
						x=300
						y=460
						-- to other halls up
				end
				if CheckCollision(x,y,110,110,270,580,100,15)then
					room = "hallway2"
					x=300
					y=460
					-- to previous hall
			end
			end
			if room == "hallway4" then
					if CheckCollision(x,y,110,110,690,250,1,100)then
						room = "hallway3"
						x=150
						y=234
						--gO BACK right side
					end
				end
				if CheckCollision(x,y,110,110,270,580,100,15)then
					room = "hallway7"
					x=300
					y=460
					-- to goal down
			end
			end
			if room == "hallway7" then
					end
					if CheckCollision(x,y,110,110,17,250,1,100)and key1==true then
						room = "key1"
				-- interact
					end
					if CheckCollision(x,y,110,110,270,15,100,15)then
						room = "hallway4"
						x=300
						y=460
						-- to previous hall up
				end
end
function love.keyreleased(key)
		if key == "return" and room == "menu" then
			room = "expositionone"
		end
		if key == "return" and room == "expositionone" and nextscene == 1 then
			room = "weapons bay"
		end
		if key == "return" and room == "journal" and nextscene == 1 then
			room = "hallway1"
		end
end

function love.draw()
	if room=="menu" then
		love.graphics.draw(love.graphics.newText(bitfont, "ARTHAS"), 280 , 230,0,2,2)
		love.graphics.draw(love.graphics.newText(bitfont, "Press enter to start"),287 , 300,0,1,1)
		y=300
		x=350
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
		love.graphics.draw(player, x, y)
	elseif room == "hallway1" then
		playable=true
		love.graphics.draw(hall,0,0)
		love.graphics.draw(interact,200,400)
		love.graphics.draw(player, x, y)
		love.graphics.setColor(0, 0, 200, 40)
		love.graphics.rectangle("fill", 680, 250, 15, 100)
		love.graphics.rectangle("fill", 17, 250, 15, 100)
		love.graphics.setColor(1, 1, 1,100)
	elseif room == "hallway2" then
		playable=true
		love.graphics.draw(hall,0,0)
		love.graphics.draw(player, x, y)
		love.graphics.setColor(0, 0, 200, 40)
		love.graphics.rectangle("fill", 680, 250, 15, 100)
		love.graphics.rectangle("fill", 270, 15, 100, 15)
		love.graphics.setColor(1, 1, 1,100)
	elseif room == "hallway3" then
		playable=true
		love.graphics.draw(hall,0,0)
		love.graphics.draw(player, x, y)
		love.graphics.setColor(0, 0, 200, 40)
		love.graphics.rectangle("fill", 680, 250, 15, 100)--right
		love.graphics.rectangle("fill", 300, 15, 100, 15)--up
		love.graphics.rectangle("fill", 300, 580, 100, 15)--down
		love.graphics.rectangle("fill", 15, 250, 15, 100)--left
		love.graphics.setColor(1, 1, 1,100)
	elseif room == "hallway4" then
		playable=true
		love.graphics.draw(hall,0,0)
		love.graphics.draw(player, x, y)
		love.graphics.setColor(0, 0, 200, 40)
		love.graphics.rectangle("fill", 680, 250, 15, 100)--right
		love.graphics.rectangle("fill", 300, 15, 100, 15)--up
		love.graphics.setColor(1, 1, 1,100)
	elseif room == "hallway5" then
		playable=true
		love.graphics.draw(hall,0,0)
		love.graphics.draw(player, x, y)
		love.graphics.setColor(0, 0, 200, 40)
		love.graphics.rectangle("fill", 680, 250, 15, 100)--right
		love.graphics.rectangle("fill", 300, 15, 100, 15)--up
		love.graphics.rectangle("fill", 15, 250, 15, 100)--left
		love.graphics.setColor(1, 1, 1,100)
	elseif room == "hallway6" then
		playable=true
		love.graphics.draw(hall,0,0)
		love.graphics.draw(player, x, y)
		love.graphics.setColor(0, 0, 200, 40)
		love.graphics.rectangle("fill", 680, 250, 15, 100)--right
		love.graphics.rectangle("fill", 300, 15, 100, 15)--up
		love.graphics.setColor(1, 1, 1,100)
	elseif room == "hallway7" then
		playable=true
		love.graphics.draw(hall,0,0)
		love.graphics.draw(keycard,234,670)
		love.graphics.draw(player, x, y)
		love.graphics.setColor(0, 0, 200, 40)
		love.graphics.rectangle("fill", 300, 15, 100, 15)--up
		love.graphics.setColor(1, 1, 1,100)
	elseif room == "journal" then
		playable=false
		love.graphics.draw(love.graphics.newText(bitfont, "You see the captains journal on the ground and pick it up."),0,70,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "In side the jounal is the captains contigency plan for if the ship ever got attacked."),0,90,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "As that is currently what is happening you think this might be helpful."),0,110,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "The journal talks about how you can leave the ship using one of the four escape pods,"),0,130,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "however only one of the four escape pods is powered and you don't know which."),0,150,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "While reading the journal you remember that the keycards and map should be."),0,170,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "They'll be in a nearby hallway."),0,190,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "Press enter to continue"),0,210,0,1.4,1.4)
		journal=false
	end
elseif room == "key1" then
		playable=false
		love.graphics.draw(love.graphics.newText(bitfont, "You have found the first keycard and will now be able to progress"),0,70,0,1.4,1.4)
		love.graphics.draw(love.graphics.newText(bitfont, "Press enter to continue"),0,210,0,1.4,1.4)
		key1=true
		end
end
