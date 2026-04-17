local mixaUiLIB = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()-- creating the library
lib = mixaUiLIB
local window = lib:CreateWindow("quiet city-luma_hub") -- use this to create a window
main = window:Tab("OP")
local function addHit(model)
    
        local HH = Instance.new("Highlight")
        HH.Parent = model
    
end
main:Button("shutdown (ONLY ON EMERGENCY)", function()
game:Shutdown()

end)
main:Button("tool esp", function()
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Model") and v:FindFirstChild("Bat") then
        addHit(v.Bat)
    elseif v:IsA("BasePart") then
       print("no")
    end
end
for _, v in pairs(workspace:GetDescendants()) do
    if v.Name ==  "Money" then
        addHit(v)
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
        Lighting.Brightness = 10
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
  end)-- PineTree1
  
  main:Button("no pinetree", function()
for i,v in pairs(workspace:GetDescendants()) do
if v:IsA("Instance") and v.Name == "PineTree1"then
v:Destroy()
end
end
  end) -- 
main = window:Tab("teleports")
    main:Button("tp to shop", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-637.577087, 5.38460922, -427.407379, 0.992321908, 0.0286850296, -0.120309822, -0.0278511997, 0.999575019, 0.00860681757, 0.120505579, -0.00518996082, 0.992699087)
  end) 
      main:Button("tp to sewer", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-125.306435, -27.6061745, -337.008331, -0.979692638, 4.58601015e-08, 0.200505152, 5.43161285e-08, 1, 3.66724286e-08, -0.200505152, 4.68183714e-08, -0.979692638)
  end) 
        main:Button("tp to tall house", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-268.386414, 60.8938217, -430.386017, 0.504252732, -1.42263232e-08, 0.863556147, 3.26849048e-10, 1, 1.62832592e-08, -0.863556147, -7.92862576e-09, 0.504252732)
  end) 
  main = window:Tab("speed")
       main:Button("speed 200", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 200
  end) 
