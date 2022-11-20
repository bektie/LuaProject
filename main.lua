

local anim = require('anim')
local mainbg = require('mainbg')
local scale = 3
love.graphics.setDefaultFilter("nearest", "nearest")
local tiles = love.graphics.newImage('tileset.png')
speed = 5
local playerAnimation = {}
local player2Animation = {}
local sword2Animation = {}

sword1Animation = {}
local fireball={
    x=400,
    y=300,
    scale=2,
    speed=0,
}
flagEnd =false
-- Fireball
local hpLine = {
    x = 10,
    y = 10,
    width = 300,
    height = 20
}
local hpLine2 = {
    x = 790,
    y = 570,
    width = -300,
    height = 20
}

 local player = {
     x = 300,
     y = 500
 }
 local player2 = {
     x = 700,
     y = 500
 }
 local sword2 = {
    x = player2.x ,
    y = player2.y 
 }
 local sword1 = {
    x = player.x ,
    y = player.y 
 }
 scalex = 3
 scaley = 3
 

-- Fireball


 function sign(v)
 if v >= 0 then return 1 else return -1 end
 end

function drawbg1()
    bg.drawbg()
end

function voidAttackSword2()
    local animation = {
        timer = 0,
        animationSpeed = 1,
        frameIdx = 1,
        frames = {}
    }
    for i = 0, 1  do
        local quad = love.graphics.newQuad(
        0, 0, 
        0, 0,
        tiles:getWidth(), tiles:getHeight()
    )
    table.insert(animation.frames, quad)
    
end
    return animation
end

    

 
function AttackSword2()
    local animation = {
        timer = 0,
        animationSpeed = 0.2,
        frameIdx = 1,
        frames = {}
    }
    for i = 0, 2  do
        local quad = love.graphics.newQuad(
        256 + i * 32, 0, ---PROBLEM IN COORDINATES
        32, 32, 
        tiles:getWidth(), tiles:getHeight()

    )
    table.insert(animation.frames, quad)
    
end

    return animation
end

function AttackSword1()
    local animation = {
        timer = 0,
        animationSpeed = 0.2,
        frameIdx = 1,
        frames = {}
    }
    for i = 0, 2  do
        local quad = love.graphics.newQuad(
        256 + i * 32,128, ---PROBLEM IN COORDINATES
        32, 32, 
        tiles:getWidth(), tiles:getHeight()

    )
    table.insert(animation.frames, quad)
    
end

    return animation
end
 
 
 function NewPlayerIdleAnimation()
     local animation = {
         timer = 0,
         animationSpeed = 0.2,
         frameIdx = 1,
         frames = {}
     }
     for i = 0, 3 do
         local quad = love.graphics.newQuad(
        80 + i * 16, 172,
         16, 28, 
         tiles:getWidth(), tiles:getHeight()
     )
     table.insert(animation.frames, quad)
 end
     return animation
 end
 
 
 function NewPlayerRunAnimation()
    local animation = {
        timer = 0,
        animationSpeed = 0.2,
        frameIdx = 1,
        frames = {}
    }
    for i = 4, 7 do
        local quad = love.graphics.newQuad(
        80 + i * 16, 169,
        16, 36, 
        tiles:getWidth(), tiles:getHeight()
    )
    table.insert(animation.frames, quad)
end
    return animation
end

function NewPlayer2RunAnimation()
    local animation = {
        timer = 0,
        animationSpeed = 0.2,
        frameIdx = 1,
        frames = {}
    }
    for i = 4, 7 do
        local quad = love.graphics.newQuad(
        80 + i * 16, 41,
        16, 28, 
        tiles:getWidth(), tiles:getHeight()
    )
    table.insert(animation.frames, quad)
end
    return animation
end

function NewPlayer2IdleAnimation()
    local animation = {
        timer = 0,
        animationSpeed = 0.2,
        frameIdx = 1,
        frames = {}
    }
    for i = 0, 3 do
        local quad = love.graphics.newQuad(
       80 + i * 16, 44,
        16, 28, 
        tiles:getWidth(), tiles:getHeight()
    )
    table.insert(animation.frames, quad)
end
    return animation
end
 
 function love.load()
	sword1Animation.void = voidAttackSword2()
    sword1Animation.attack = AttackSword1()
     sword2Animation.attack = AttackSword2()
     sword2Animation.void = voidAttackSword2()
     playerAnimation.idle = NewPlayerIdleAnimation()
     playerAnimation.run = NewPlayerRunAnimation()
     player2Animation.idle = NewPlayer2IdleAnimation()
     player2Animation.run = NewPlayer2RunAnimation()
 end
 

 function love.update(dt)
    if love.keyboard.isDown('l') and fireball.speed==0 then
        fireball.speed=fireball.speed+7
    end
	

    sword2.x = player2.x +16
    sword2.y = player2.y -32
    sword1.x = player.x +16
    sword1.y = player.y -32
     playerAnimation.current = playerAnimation.idle
     player2Animation.current = player2Animation.idle
     
     sword2Animation.current = sword2Animation.void
     sword1Animation.current = sword1Animation.void
     if love.keyboard.isDown('k') then 
        sword2Animation.current = sword2Animation.attack
    end 
    if love.keyboard.isDown('j') then
        sword1Animation.current = sword1Animation.attack
    end
     if love.keyboard.isDown('a') then
         player.x = player.x - speed
         playerAnimation.current = playerAnimation.run
     end
     if love.keyboard.isDown('d') then
         player.x = player.x + speed
         playerAnimation.current = playerAnimation.run
     end
     if love.keyboard.isDown('w') then
         player.y = player.y - speed
         playerAnimation.current = playerAnimation.run
     end
     if love.keyboard.isDown('s') then
         player.y = player.y + speed
         playerAnimation.current = playerAnimation.run
     end
     if love.keyboard.isDown('left') then
         player2.x = player2.x - speed
         player2Animation.current = player2Animation.run
     end
     if love.keyboard.isDown('right') then
         player2.x = player2.x + speed
         player2Animation.current = player2Animation.run
     end
     if love.keyboard.isDown('up') then
         player2.y = player2.y - speed
         player2Animation.current = player2Animation.run
     end
     if love.keyboard.isDown('down') then
         player2.y = player2.y + speed
         player2Animation.current = player2Animation.run
     end
     anim.update(playerAnimation.current, dt)
     anim.update(player2Animation.current, dt)
     anim.update(sword2Animation.current, dt)
     anim.update(sword1Animation.current, dt)
     
    dirX2 = -sign(player2.x - player.x )
    dirX1 = sign(player2.x - player.x )
    
    if dirX2 == -1 then
        a = sword2.x-1*scale*dirX2
    end
    if dirX2 == 1 then
        a = sword2.x-8*scale*dirX2
    end

    if dirX1 == -1 then
        f = sword1.x-1*scale*dirX1
    end
    if dirX1 == 1 then
        f = sword1.x-8*scale*dirX1
    end

    if player2.x>750 then
        player2.x=750
    end
    if player2.x<30 then
        player2.x=30
    end
    if player2.y<0 then
        player2.y=0
    end
    if player2.y>500 then
        player2.y=500
    end
    if player.x>750 then
        player.x=750
    end
    if player.x<30 then
        player.x=30
    end
    if player.y<0 then
        player.y=0
    end
    if player.y>500 then
        player.y=500
    end

    if hpLine.width <= 0 then
        flagEnd = true
    end
    if hpLine2.width >= 0 then
        flagEnd = true
    end


    if dirX2 == -1 then
        if player2.y > player.y then -- if p2 is lower
            if player2.x - player.x <= 100 and math.abs(player.y - player2.y)<=16 and love.keyboard.isDown('k') then
                hpLine.width = hpLine.width - 1
            end
        end
        if player2.y < player.y then --if p2 is higher
            if player2.x - player.x <= 100 and math.abs(player2.y - player.y)<=16  and love.keyboard.isDown('k')  then
                hpLine.width = hpLine.width - 1
            end
        end
        if player2.y == player.y and player2.x - player.x <= 100 and love.keyboard.isDown('k')   then
            hpLine.width = hpLine.width - 1
        end
    
    end
    if dirX2 == 1 then
        if player2.y > player.y then --if p2 is lower
            if player.x - player2.x <= 100 and math.abs(player.y - player2.y)<=16 and love.keyboard.isDown('k') then
                hpLine.width = hpLine.width - 1
            end
        end
        if player2.y < player.y then--if p2 is higher
            if player2.x - player.x <= 100 and math.abs(player.y - player2.y)<=16 and love.keyboard.isDown('k')  then
            hpLine.width = hpLine.width - 1
            end
        end
        if player2.y == player.y and player2.x - player.x <= 100 and love.keyboard.isDown('k')   then
            hpLine.width = hpLine.width - 1
        end 
    end
    ---------------




   if dirX1 == 1 then
        if player.y > player2.y then --if p2 is lower
            if math.abs(player.x - player2.x) <= 100 and math.abs(player2.y - player.y)<=16 and love.keyboard.isDown('j')  then
                hpLine2.width = hpLine2.width + 1
            end
        end
        if player.y < player2.y then --if p2 is lower
            if math.abs(player.x - player2.x) <= 100 and math.abs(player2.y - player.y)<=16 and love.keyboard.isDown('j')  then
                hpLine2.width = hpLine2.width + 1
            end
        end
        if player.y == player2.y and math.abs(player.x - player2.x) <= 100 and love.keyboard.isDown('j')   then
            hpLine2.width = hpLine2.width + 1
        end 
    end


    if dirX1 == -1 then
        if player.y > player2.y then -- if p is lower
            if math.abs(player.x - player2.x) <= 100 and math.abs(player2.y - player.y)<=16 and love.keyboard.isDown('j') then
                hpLine2.width = hpLine2.width + 1
            end
        end
        if player.y < player2.y then -- if p is lower
            if math.abs(player.x - player2.x) <= 100 and math.abs(player2.y - player.y)<=16 and love.keyboard.isDown('j') then
                hpLine2.width = hpLine2.width + 1
            end
        end
        if player.y == player2.y and math.abs(player.x - player2.x) <= 100 and love.keyboard.isDown('j')  then
            hpLine2.width = hpLine2.width + 1
        end
    
        end
    
    ---

end



 function love.draw()
    love.graphics.setColor(1,1,1)
	mainbg.drawbg()
     local frame = anim.getFrame(playerAnimation.current)
     local frame2 = anim.getFrame(player2Animation.current)
     local frame3 = anim.getFrame(sword2Animation.current)
     local frame4 = anim.getFrame(sword1Animation.current)
     --love.graphics.draw(fireMagic,quadfire,fireball.x,fireball.y,0,fireball.scale,fireball.scale)
     love.graphics.draw(tiles, frame3, a, sword2.y - 1 * scale * dirX2, 0, scalex*dirX2, scaley)
     love.graphics.draw(tiles, frame4, f, sword1.y - 1 * scale * dirX1, 0, scalex*dirX1, scaley)
     love.graphics.draw(tiles, frame, player.x - 8 * scale * dirX1, player.y, 0, dirX1 * scalex, scaley)
     love.graphics.draw(tiles, frame2, player2.x - 8 * scale * dirX2, player2.y, 0, dirX2 * scalex, scaley)
     love.graphics.setColor(10, 0, 0)
     love.graphics.rectangle("fill", hpLine.x, hpLine.y, hpLine.width, hpLine.height)
     love.graphics.rectangle("fill", hpLine2.x, hpLine2.y, hpLine2.width, hpLine2.height)

     if flagEnd then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", 0,0,800,600)
        love.graphics.setColor(1,1,1)
        love.graphics.print("END", 400, 300, 0, 3)
    end

    end
