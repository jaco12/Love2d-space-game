--Imports
function love.load()
	rick=love.graphics.newImage("rickImage.png")
	tile=love.graphics.newImage("tile.png")
	mainTheme = love.audio.newSource("URMUM.mp3", "static")
	int=2
	player = love.graphics.newImage("Astronaut.png")
	--110*110
--vars
	x=0
	y=0
	speed = 80
	bitfont = love.graphics.newFont("8BIT WONDER Nominal.ttf")
	playable=false
	room ="menu"
end
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
function wait(time)
    local duration = os.time() + time
    while os.time() < duration do end
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
			if CheckCollision(x+350,y+300,110,110,750,0,50,600)then
				x= x-(speed*dt)
			end
			if CheckCollision(x+350,y+300,110,110,0,550,700,100)then
				y= y-(speed*dt)
			end
			if CheckCollision(x+350,y+300,110,110,0,0,50,600)then
				x= x+(speed*dt)
			end
			if CheckCollision(x+350,y+300,110,110,0,0,250,50)then
				y= y+(speed*dt)
			end
			if CheckCollision(x+350,y+300,110,110,450,0,250,50)then
				y= y+(speed*dt)
			end
			if CheckCollision(x+350,y+300,110,110,250,0,50,200)then
				room = "hallway"
			end

		end
end



function love.draw()
	if level == "weapons bay" then

			love.graphics.draw(player, x+350, y+300)
			love.graphics.rectangle("fill", 250, 0, 200, 50)
			love.graphics.rectangle("fill", 450,0,250,50)
			love.graphics.rectangle("fill", 0,0,250,50)
			love.graphics.rectangle("fill", 0,0,50,600)
			love.graphics.rectangle("fill", 0,550,700,100)
			love.graphics.rectangle("fill", 750,0,50,600)
	elseif room=="menu" then
		love.graphics.draw(love.graphics.newText(bitfont, "ARTHAS"), 280 , 230,0,2,2)
		love.graphics.draw(love.graphics.newText(bitfont, "Press enter to start"),287 , 300,0,1,1)
			if love.keyboard.isDown("return") and room == "menu" then
				room = "expositionone"
			end
	elseif room=="expositionone" then
			love.graphics.draw(love.graphics.newText(bitfont, "You wake up in the weapons bay."),280 , 70,0,.8,.8)
				wait(.5)
				love.graphics.draw(love.graphics.newText(bitfont, "Everything was a blur to you at first when the memory of the attack came rushing back to you.."),280 , 90,0,.8,.8)
				wait(.5)
				love.graphics.draw(love.graphics.newText(bitfont, "You remember that you and your friends were initially going to the escape pods however the three of you split up when you saw a group of pirates heading in your direction."),280 , 110,0,.8,.8)
				wait(.5)
				love.graphics.draw(love.graphics.newText(bitfont, "You ran to the weapons bay in hopes of finding a place to hide only to trip on a small crate and hit your head on the floor, knocking you out."),280 , 130,0,.8,.8)
				wait(.5)
				love.graphics.draw(love.graphics.newText(bitfont, "Pulling out your communicator, you try to contact the first and 2nd engineer but all you heard was static on their end."),280 , 150,0,.8,.8)
				wait(.5)
				love.graphics.draw(love.graphics.newText(bitfont, "Realizing that your friends are missing, you get on your feet and set your goal on finding a way off the ship."),280 , 170,0,.8,.8)
				wait(.5)
				love.graphics.draw(love.graphics.newText(bitfont, "From what you can tell based on the condition of the ship, you were unconscious for at least a couple of hours which means you don’t have a lot of time left to find a functioning escape pod before the ship is completely destroyed."),280 , 190,0,.8,.8)
				wait(.5)
		end
	end
end
