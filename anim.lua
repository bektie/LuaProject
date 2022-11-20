
local function animationUpdate(self, dt)
    self.timer = self.timer + dt
    local n = #self.frames
    if self.timer >= self.animationSpeed then
        self.timer = self.timer - self.animationSpeed
        self.frameIdx = self.frameIdx%n + 1
    end
end
local function animationFrame(self)
    return self.frames[self.frameIdx]
end
return { 
    update = animationUpdate,
    getFrame = animationFrame
 }