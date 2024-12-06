import "CoreLibs/object"
import "CoreLibs/sprites"
local angle = 0
local image = playdate.graphics.imagetable.new('images/guy3')
local image1 = image:getImage(1)
local image2 = image:getImage(2)
local mysprite = playdate.graphics.sprite.new(image1)
local mysprite2 = playdate.graphics.sprite.new(image2)
local oldAngle = angle
mysprite:moveTo(200, 150)
mysprite:add()
mysprite2:moveTo(300, 150)
mysprite2:add()
playdate.graphics.clear(playdate.graphics.kColorBlack)
mysprite:setZIndex(5)
mysprite2:setZIndex(4)


function mysprite:update()
	self:setScale(0.1, 0.1)
	-- if (image2 ~= nil) then
	-- 	image2:drawRotated(self.x, self.y, oldAngle, self:getScale())
	-- end
end

function mysprite2:update()
	local scale = 0.1
	self:setScale(scale, scale)
	self:setRotation(angle, scale, scale)
end


playdate.display.setRefreshRate(50)


function playdate.update()
	playdate.graphics.setBackgroundColor(playdate.graphics.kColorClear);
	playdate.graphics.clear(playdate.graphics.kColorBlack)
	playdate.graphics.setColor(playdate.graphics.kColorWhite)
	playdate.graphics.fillRect(mysprite2.x-0.5*mysprite2.width*3, mysprite2.y-mysprite.height*0.5*2, mysprite2.width*3, mysprite2.height*2)
	playdate.graphics.setPattern({ 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55 })
	playdate.graphics.fillRect(40, 40, 100, 80)
	oldAngle = angle
	angle = playdate.getCrankPosition();
	mysprite:setRotation(angle, 1, 1)
	playdate.graphics.sprite.update()
	playdate.drawFPS(380, 225)
end


