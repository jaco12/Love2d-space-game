--Imports
function love.load()
	rick=love.graphics.newImage("rickImage.png")
	tile=love.graphics.newImage("tile.png")
	mainTheme = love.audio.newSource("URMUM.mp3", "static")
	int=2
--vars
	x=0
	y=0
	speed = 80
	bitfont = love.graphics.newFont("8BIT WONDER Nominal.ttf")
	playable=false
	level ="menu"

end

--every frame
function love.update(dt)
	love.audio.play(mainTheme)
		if playable == true then
			if love.keyboard.isDown('right') then
	      x = x - (speed * dt)
			elseif love.keyboard.isDown('left') then
				x = x + (speed * dt)
			elseif love.keyboard.isDown('down') then
				y=y-(speed*dt)
			elseif love.keyboard.isDown('up') then
				y=y+(speed*dt)
		end
end

function love.draw()
	if playable == true then
		love.graphics.draw(tile, x, y)
		love.graphics.draw(tile, x+100, y+100)
		love.graphics.draw(tile, x+200, y)
		love.graphics.draw(tile, x+300, y)
		love.graphics.draw(tile, x+400, y)
		love.graphics.draw(tile, x+500, y)
		love.graphics.draw(tile, x+600, y)
		love.graphics.draw(tile, x+700, y)
		love.graphics.draw(tile, x, y+200)
		love.graphics.draw(tile, x, y+300)
		love.graphics.draw(tile, x, y+400)
		love.graphics.draw(tile, x, y+500)
		love.graphics.draw(tile, x, y+600)
		love.graphics.draw(tile, x-100, y-100)
		love.graphics.draw(tile, x+100, y)
		love.graphics.draw(tile, x, y+100)
		love.graphics.draw(, x+, y, r)
	elseif playable == false and level =="menu" then
		love.graphics.draw(love.graphics.newText(bitfont, "ARTHAS"), 280 , 230,0,2,2)
		love.graphics.draw(love.graphics.newText(bitfont, "Press enter to start"),287 , 300,0,1,1)
			if love.keyboard.isDown("return") then
				playable=true
				level = "one"
			end
		end
	end
end
