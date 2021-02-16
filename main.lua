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
	syncopateRaster = love.font.newRasterizer("8BIT WONDER Nominal.ttf")
	syncopate = love.font.newFontData(syncopateRaster)
	playable=false
end

--every frame
function love.update(dt)
	love.audio.play(mainTheme)
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
		love.graphics.draw(tile, x-100, y-100)
		love.graphics.draw(tile, x+100, y)
		love.graphics.draw(tile, x, y+100)
	end
end
