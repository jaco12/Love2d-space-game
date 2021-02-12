--Imports
rick=love.graphics.newImage("rickImage.png")
tile=love.graphics.newImage("tile.png")
mainTheme = love.audio.newSource("URMUM.mp3", "static")
int=2
--vars
x=0
y=0
speed = 50
--original set up
love.audio.play(mainTheme)
--every frame
function love.update(dt)

			if love.keyboard.isDown('right') then
	      x = x + (speed * dt)
			elseif love.keyboard.isDown('left') then
				x = x - (speed * dt)
			elseif love.keyboard.isDown('down') then
				y=y-(speed*dt)
			elseif love.keyboard.isDown('up') then
				y=y+(speed*dt)
			end
end

function love.draw()
	love.graphics.draw(tile, x, y)
end
