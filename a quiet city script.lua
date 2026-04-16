local mixaUiLIB = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()-- creating the library
lib = mixaUiLIB
main = lib
local window = lib:CreateWindow("quiet city-luma_hub") -- use this to create a window
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
