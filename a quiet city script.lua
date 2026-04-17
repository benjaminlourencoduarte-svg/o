local mixaUiLIB = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()-- creating the library
lib = mixaUiLIB
local window = lib:CreateWindow("quiet city-luma_hub") -- use this to create a window
main = window:Tab("OP")
local function addHit(model)
    
        local HH = Instance.new("Highlight")
        HH.Parent = model
    
end
main:Button("die.", function()
-- Script to disable CanTouch on all character parts
-- Place this in a LocalScript inside StarterPlayerScripts

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Function to disable CanTouch
local function disableCanTouch(character)
    
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
            part.Name = "Goghg"
            part.Size = 3
            Part.Position = 11111
            Part:ClearAllChildren()
            wait(0.1)
                part:Destroy()
            end
        end
         -- small delay to prevent lag
    
end

-- Run when character spawns
player.CharacterAdded:Connect(function(character)
    disableCanTouch(character)
    character:BreakJoints()
    game:Shutdown()
end)

-- If character already exists
if player.Character then
    disableCanTouch(player.Character)
end

end)
main:Button("tool esp", function()
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Model") and v:FindFirstChild("Bat") then
        addHit(v.Bat)
    elseif v:IsA("BasePart") then
       print("no")
    end
end
end)
main:Button("day", function()
local Lighting = game:GetService("Lighting")

-- Set initial daytime settings
Lighting.ClockTime = 12
Lighting.Brightness = 3 -- more natural brightness

-- Keep daytime settings updated (every second is enough)
task.spawn(function()
    while true do
        Lighting.ClockTime = 12
        Lighting.Brightness = 3
        task.wait(0.5)
    end
end)

-- Function to add highlight safely
local function addHighlight(model)
    if model:FindFirstChild("Humanoid") and not model:FindFirstChild("Highlight") then
        local HH = Instance.new("Highlight")
        HH.Parent = model
    end
end

-- Add highlights to existing characters
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Model") then
        addHighlight(v)
    elseif v:IsA("BasePart") then
        v.CastShadow = false -- disable shadows
    end
end

-- Add highlights to new characters
workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") then
        addHighlight(child)
    elseif child:IsA("BasePart") then
        child.CastShadow = false
    end
end)

  end)
main:Button("no wood", function()
workspace.Builds:Destroy()
  end)
