
love.graphics.setDefaultFilter("nearest","nearest")


local scale =3

local tileset=love.graphics.newImage('tileset.png')
local quadbgw=love.graphics.newQuad(0,0,16,16,tileset:getWidth(), tileset:getHeight())
local quadbgf=love.graphics.newQuad(0,32,16,16,tileset:getWidth(), tileset:getHeight())
--local quadfire=love.graphics.newQuad(496,319,32,33,fireMagic:getWidth(), fireMagic:getHeight())
local quadbgt=love.graphics.newQuad(0,97,16,16,tileset:getWidth(), tileset:getHeight())
local quadbgb=love.graphics.newQuad(17,97,15,15,tileset:getWidth(), tileset:getHeight())
local quadbgk=love.graphics.newQuad(0,114,16,16,tileset:getWidth(), tileset:getHeight())
local quadbgk2=love.graphics.newQuad(16,114,16,16,tileset:getWidth(), tileset:getHeight())
local quadbgk3=love.graphics.newQuad(32,114,16,16,tileset:getWidth(), tileset:getHeight())


local wallLeft={
        x=1,
        y=1,
}

local wallRight={
        x=775,
        y=1,
}

local wallUp={
        x=1,
        y=1
}

local wallDown={
        x=1,
        y=575,
}

local floor={
        x=25,
        y=18,
}

local texture1={
        x=25,
        y=23,
}

local texture2={
        x=25,
        y=300,
}


local texture3={
        x=25,
        y=529,
}


local texture4={
        x=200,
        y=450,
}


local texture5={
        x=600,
        y=200,
}


local texture6={
        x=727,
        y=23,
}


local texture7={
        x=727,
        y=300,
}


local texture8={
        x=727,
        y=527,
}

local texture9={
        x=150,
        y=150,
}

local texture10={
        x=400,
        y=400,
}

local texture11={
        x=600,
        y=450,
}


local texture12p1={
        x=200,
        y=268,
}

local texture12p2={
        x=200,
        y=309,
}

local texture12p3={
        x=200,
        y=345,
}



local texture13p1={
        x=400,
        y=168,
}

local texture13p2={
        x=400,
        y=209,
}

local texture13p3={
        x=400,
        y=245,
}

local texture14p1={
        x=500,
        y=68,
}

local texture14p2={
        x=500,
        y=109,
}

local texture14p3={
        x=500,
        y=145,
}





function drawbg()
        for i=0,532/16/scale do
                for j=0,785/16/scale do
                        love.graphics.draw(tileset,quadbgf,floor.x+16*j*scale,floor.y+16*i*scale,0,scale,scale) 
                end              
        end

        for i=0,600/14/scale do
                love.graphics.draw(tileset,quadbgw,wallLeft.x,wallLeft.y+14*i*scale,0,scale/2,scale)
        end
        
        for i=0,800/14/scale do
                love.graphics.draw(tileset,quadbgw,wallUp.x+14*i*scale,wallUp.y,0,scale,scale/2)
        end

        for i=0,600/14/scale do
                love.graphics.draw(tileset,quadbgw,wallRight.x,wallRight.y+14*i*scale,0,scale/2,scale)
        end

        for i=0,800/14/scale do
                love.graphics.draw(tileset,quadbgw,wallDown.x+14*i*scale,wallDown.y,0,scale,scale/2)
        end   

        love.graphics.draw(tileset,quadbgt,texture1.x,texture1.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgt,texture2.x,texture2.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgt,texture3.x,texture3.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgt,texture4.x,texture4.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgt,texture5.x,texture5.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgt,texture6.x,texture6.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgt,texture7.x,texture7.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgt,texture8.x,texture8.y,0,scale,scale)

        love.graphics.draw(tileset,quadbgb,texture9.x,texture9.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgb,texture10.x,texture10.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgb,texture11.x,texture11.y,0,scale,scale)

        love.graphics.draw(tileset,quadbgk,texture12p1.x,texture12p1.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgk2,texture12p2.x,texture12p2.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgk3,texture12p3.x,texture12p3.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgk,texture13p1.x,texture13p1.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgk2,texture13p2.x,texture13p2.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgk3,texture13p3.x,texture13p3.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgk,texture14p1.x,texture14p1.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgk2,texture14p2.x,texture14p2.y,0,scale,scale)
        love.graphics.draw(tileset,quadbgk3,texture14p3.x,texture14p3.y,0,scale,scale)
        
end


return {
       drawbg = drawbg
}