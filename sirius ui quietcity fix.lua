-- Function to generate a random hex string
local function randomHex(length)
    local hexChars = "0123456789abcdef"
    local result = ""
    for i = 1, length do
        local randIndex = math.random(1, #hexChars)
        result = result .. string.sub(hexChars, randIndex, randIndex)
    end
    return result
end

-- Function to generate the key
local function generateKey()
    -- 16 hex characters
    local hexPart = randomHex(16)
    return "Token-" .. hexPart .. "😉"
end

local key = generateKey()

-- Settings block wrapped in pcall to avoid runtime errors breaking the whole script
local _, result = pcall(function()
    -- File name for storing settings
    local settingsFile = "MySettings.txt"

    -- Default settings
    local defaultSettings = {
        volume = 3, -- number of ColorCorrectionEffects
    }

    local HttpService = game:GetService("HttpService")
    local Lighting = game:GetService("Lighting")

    -- Function to save settings to file
    local function saveSettings(settings)
        local encoded = HttpService:JSONEncode(settings)
        if writefile then
            writefile(settingsFile, encoded)
        end
    end

    -- Function to load settings from file
    local function loadSettings()
        if isfile and isfile(settingsFile) then
            local contents = readfile(settingsFile)
            local decoded = HttpService:JSONDecode(contents)
            return decoded
        else
            -- File not found, create with default settings
            saveSettings(defaultSettings)
            return defaultSettings
        end
    end

    -- Function to apply settings
    local function applySettings(settings)
        -- Clear old ColorCorrectionEffects
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("ColorCorrectionEffect") then
                obj:Destroy()
            end
        end

        -- Add new ColorCorrectionEffects based on "volume"
        local volume = tonumber(settings.volume) or settings.volume or 0
        for i = 1, volume do
            local cc = Instance.new("ColorCorrectionEffect")
            cc.Name = "CC_" .. i
            cc.TintColor = Color3.fromRGB(255, 255, 255) -- neutral tint
            cc.Parent = Lighting
        end
    end

    -- Example usage
    local settings = loadSettings()
    applySettings(settings)

    print("Settings updated.")
end) -- closes the first pcall correctly


-- Script to detect if a player is in the group Khongumu (ID: 12369782)
local GROUP_ID = 12369782
local GROUP_NAME = "Khongumu"

local _, result = pcall(function()
    local player = game.Players.LocalPlayer
    if not player then return end
    local isInGroup = false
    if pcall(function() isInGroup = player:IsInGroup(GROUP_ID) end) then
        -- ok
    end

    if isInGroup then
        -- Notification (wrapped to avoid runtime errors)
        local success, AkaliNotif = pcall(function()
            return loadstring(game:HttpGet('https://raw.githubusercontent.com/DozeIsOkLol/NotificationLibs/refs/heads/main/AkaliNotif/AkaliNotifSource.lua'))()
        end)
        if success and AkaliNotif and AkaliNotif.Notify then
            local Notify = AkaliNotif.Notify
            Notify({
                Title = 'never gonna give you up',
                Description = '💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 ',
                Duration = 5,
            })
        end

        -- Visual effects (kept minimal and safe)
        local Lighting = game:GetService("Lighting")
        local blur = Instance.new("BlurEffect")
        blur.Size = 50
        blur.Parent = Lighting

        spawn(function()
            while wait(0.5) do
                local bloom = Instance.new("BloomEffect")
                bloom.Intensity = 1
                bloom.Size = 10
                bloom.Threshold = 0.0
                bloom.Parent = Lighting
                wait(1)
                if bloom and bloom.Parent then
                    bloom:Destroy()
                end
            end
        end)

        wait(3)
        if pcall(function() player:Kick("You are banned from this script.") end) then
            -- kicked
        end
    end
end) -- closes the pcall correctly


-- Download images (wrapped in pcall and guarded)
local _, result = pcall(function()
    if writefile and game and game.HttpGet then
        -- some environments don't allow HttpGet; guard with pcall
        pcall(function()
            writefile("axe.png", game:HttpGet("https://tse2.mm.bing.net/th/id/OIP.W8Zpprqfq0a7-cILvyUBfwAAAA?w=256&h=256&rs=1&pid=ImgDetMain&o=7&rm=3"))
        end)
    end
end)

local getcustomasset = getcustomasset or getsynasset
local img = nil
pcall(function() img = getcustomasset and getcustomasset("axe.png") end)

local _, result = pcall(function()
    if writefile and game and game.HttpGet then
        pcall(function()
            writefile("QuestionMark.png", game:HttpGet("https://png.pngtree.com/png-clipart/20191121/original/pngtree-vector-question-mark-icon-png-image_5159031.jpg"))
        end)
    end
end)

local _, result = pcall(function()
    if writefile and game and game.HttpGet then
        pcall(function()
            writefile("bk.png", game:HttpGet("https://avatars.githubusercontent.com/u/137511182?v=4"))
        end)
    end
end)

local img1 = nil
local img2 = nil
pcall(function() img1 = getcustomasset and getcustomasset("QuestionMark.png") end)
pcall(function() img2 = getcustomasset and getcustomasset("bk.png") end)


-- Rayfield UI init (wrapped)
local Rayfield = nil
pcall(function()
    Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if Rayfield then
    local Window = Rayfield:CreateWindow({
       Name = "Quiet city - luma hub",
       Icon = 0,
       LoadingTitle = "pro quiet city ",
       LoadingSubtitle = "by benjamin",
       ShowText = "quiet city",
       Theme = "Bloom",
       ToggleUIKeybind = "K",
       DisableRayfieldPrompts = false,
       DisableBuildWarnings = false,
       ConfigurationSaving = {
          Enabled = true,
          FolderName = nil,
          FileName = "Luma Hub"
       },
       Discord = {
          Enabled = false,
          Invite = "noinvitelink",
          RememberJoins = true
       },
       KeySystem = false,
       KeySettings = {
          Title = "Untitled",
          Subtitle = "Key System",
          Note = "No method of obtaining the key is provided",
          FileName = "Key",
          SaveKey = true,
          GrabKeyFromSite = false,
          Key = {"no"}
       }
    })

    -- OP Tab
    local OP = Window:CreateTab("OP", img)
    local function addHit(target)
       if not target then return end
       if not target:FindFirstChild("Highlight") then
          local HH = Instance.new("Highlight")
          HH.Parent = target
          HH.Adornee = target
       end

       local adorneePart
       if target:IsA("Model") then
          adorneePart = target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart")
       elseif target:IsA("BasePart") then
          adorneePart = target
       end

       if adorneePart then
          local billboard = Instance.new("BillboardGui")
          billboard.Size = UDim2.new(0, 200, 0, 50)
          billboard.StudsOffset = Vector3.new(0, 3, 0)
          billboard.Adornee = adorneePart
          billboard.AlwaysOnTop = true
          billboard.Parent = game:GetService("CoreGui")

          local text = Instance.new("TextLabel")
          text.Size = UDim2.new(1, 0, 1, 0)
          text.BackgroundTransparency = 1
          text.Text = target.Name
          text.TextColor3 = Color3.new(1, 0, 0)
          text.TextStrokeTransparency = 0
          text.TextStrokeColor3 = Color3.new(0, 0, 0)
          text.TextScaled = true
          text.Font = Enum.Font.GothamBold
          text.Parent = billboard
       end
    end

    OP:CreateButton({
       Name = "Shutdown (ONLY ON EMERGENCY)",
       Callback = function()
          pcall(function() game:Shutdown() end)
       end
    })

    OP:CreateButton({
       Name = "Tool ESP",
       Callback = function()
          for _, v in pairs(workspace:GetDescendants()) do
             if v:IsA("Model") and v:FindFirstChild("Bat") then
                addHit(v)
             end
             if v:IsA("BasePart") and v.Name == "Money" then
                addHit(v)
             end
          end
       end
    })

    OP:CreateButton({
       Name = "Day Mode",
       Callback = function()
          local Lighting = game:GetService("Lighting")
          Lighting.ClockTime = 12
          Lighting.Brightness = 3
          task.spawn(function()
             while true do
                Lighting.ClockTime = 12
                Lighting.Brightness = 10
                task.wait(0.5)
             end
          end)
       end
    })

    OP:CreateButton({
       Name = "No Wood",
       Callback = function()
          if workspace:FindFirstChild("Builds") then
             workspace.Builds:Destroy()
          end
       end
    })
OP:CreateButton({
       Name = "godmode",
       Callback = function()
          local function FeGodMode()
	game.Players.LocalPlayer.Character.Humanoid.Name = 1
	local l = game.Players.LocalPlayer.Character["1"]:Clone()
	l.Parent = game.Players.LocalPlayer.Character
	l.Name = "Humanoid"
	game.Players.LocalPlayer.Character.Animate.Disabled = true
	wait()
	game.Players.LocalPlayer.Character.Animate.Disabled = false
	game.Players.LocalPlayer.Character["1"]:Destroy()
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
end
      FeGodMode()          
       end
    })
    OP:CreateButton({
       Name = "No PineTree",
       Callback = function()
          for _, v in pairs(workspace:GetDescendants()) do
             if v.Name == "PineTree1" then
                v:Destroy()
             end
          end
       end
    })

    -- Teleports Tab
    local Teleports = Window:CreateTab("Teleports", img2)

    Teleports:CreateButton({
       Name = "TP to Shop",
       Callback = function()
          local plr = game.Players.LocalPlayer
          if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
             plr.Character.HumanoidRootPart.CFrame = CFrame.new(-637.577, 5.384, -427.407)
          end
       end
    })

    Teleports:CreateButton({
       Name = "TP to Sewer",
       Callback = function()
          local plr = game.Players.LocalPlayer
          if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
             plr.Character.HumanoidRootPart.CFrame = CFrame.new(-125.306, -27.606, -337.008)
          end
       end
    })

    Teleports:CreateButton({
       Name = "TP to Hospital",
       Callback = function()
          local plr = game.Players.LocalPlayer
          if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
             plr.Character.HumanoidRootPart.CFrame = CFrame.new(-17.271, 47.018, -433.597)
          end
       end
    })

    Teleports:CreateButton({
       Name = "TP to Tall House",
       Callback = function()
          local plr = game.Players.LocalPlayer
          if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
             plr.Character.HumanoidRootPart.CFrame = CFrame.new(-268.386, 60.893, -430.386)
          end
       end
    })

    Teleports:CreateButton({
       Name = "TP to Nearest Money",
       Callback = function()
          local player = game.Players.LocalPlayer
          local char = player and player.Character
          if not char or not char:FindFirstChild("HumanoidRootPart") then return end
          local root = char.HumanoidRootPart
          local nearestMoney
          local shortestDist = math.huge

          for _, v in pairs(workspace:GetDescendants()) do
             if v:IsA("BasePart") and v.Name == "Money" then
                local dist = (v.Position - root.Position).Magnitude
                if dist < shortestDist then
                   shortestDist = dist
                   nearestMoney = v
                end
             end
          end

          if nearestMoney then
             root.CFrame = CFrame.new(nearestMoney.Position + Vector3.new(0, 3, 0))
          end
       end
    })

    Teleports:CreateButton({
       Name = "Auto Collect Nearest Money",
       Callback = function()
          local player = game.Players.LocalPlayer
          local char = player and player.Character
          if not char or not char:FindFirstChild("HumanoidRootPart") then return end
          local root = char.HumanoidRootPart

          task.spawn(function()
             while true do
                local nearestMoney
                local shortestDist = math.huge

                for _, v in pairs(workspace:GetDescendants()) do
                   if v:IsA("BasePart") and v.Name == "Money" then
                      local dist = (v.Position - root.Position).Magnitude
                      if dist < shortestDist then
                         shortestDist = dist
                         nearestMoney = v
                      end
                   end
                end

                if nearestMoney then
                   root.CFrame = CFrame.new(nearestMoney.Position + Vector3.new(0, 3, 0))
                   local prompt = nearestMoney:FindFirstChildWhichIsA("ProximityPrompt")
                   if prompt then
                      pcall(function() fireproximityprompt(prompt) end)
                   end
                end

                task.wait(1)
             end
          end)
       end
    })

    -- Other Tab
    local Other = Window:CreateTab("Other", img1)

    local _, result = pcall(function()
        local Input = Other:CreateInput({
           Name = "colorcorrection brighthness",
           CurrentValue = "1",
           PlaceholderText = "input a number....",
           RemoveTextAfterFocusLost = false,
           Flag = "Input1",
           Callback = function(Text)
                settings.volume = tonumber(Text) or Text
                saveSettings(settings)
                applySettings(settings)
           end,
        })
    end)

    Other:CreateButton({
       Name = "Anti Lag",
       Callback = function()
          local function clearWorkspace()
             for _, obj in pairs(workspace:GetChildren()) do
                if obj:IsA("Part") and not obj.Anchored and not obj.Parent:FindFirstChild("Humanoid") then
                   obj:ClearAllChildren()
                end
                if obj:IsA("ParticleEmitter") then
                   obj.Lifetime = NumberRange.new(1, 2)
                   obj.Rate = math.min(obj.Rate, 20)
                end
                if obj:IsA("Sound") then
                   obj.Volume = math.min(obj.Volume, 0.5)
                end
             end
          end

          local function optimizeCharacters()
             for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character then
                   for _, part in pairs(player.Character:GetDescendants()) do
                      if part:IsA("ParticleEmitter") then
                         part.Rate = math.min(part.Rate, 15)
                      elseif part:IsA("Trail") then
                         part.Lifetime = 0.5
                      end
                   end
                end
             end
          end

          while true do
             clearWorkspace()
             optimizeCharacters()
             wait(30)
          end
       end
    })

    Other:CreateButton({
       Name = "ESP",
       Callback = function()
          local function addHighlight(model)
             if model:FindFirstChild("Humanoid") and not model:FindFirstChild("Highlight") then
                local HH = Instance.new("Highlight")
                HH.Parent = model
             end
          end

          for _, v in pairs(workspace:GetDescendants()) do
             if v:IsA("Model") then
                addHighlight(v)
             elseif v:IsA("BasePart") then
                v.CastShadow = false
             end
          end

          workspace.ChildAdded:Connect(function(child)
             if child:IsA("Model") then
                addHighlight(child)
             elseif child:IsA("BasePart") then
                child.CastShadow = false
             end
          end)
       end
    })

    Other:CreateButton({
       Name = "Connect Network (Joke)",
       Callback = function()
          game:GetService("GuiService"):SetGameplayPausedNotificationEnabled(false)
          local Players = game:GetService("Players")
          local player = Players.LocalPlayer
          if not player or not player.Character then return end

          local velocity = Vector3.new(0, 1e5, 0)

          local function makeFly(part)
             local model = part.Parent
             if not model then return end

             part.CanCollide = false

             for _, descendant in pairs(model:GetDescendants()) do
                if descendant:IsA("Script") or descendant:IsA("LocalScript") then
                   descendant:Destroy()
                end
             end

             if model:FindFirstChild("Humanoid") then
                local humanoid = model:FindFirstChild("Humanoid")
                local root = model:FindFirstChild("HumanoidRootPart") or part

                if humanoid and root then
                   humanoid:ChangeState(Enum.HumanoidStateType.Physics)

                   if not root:FindFirstChild("BodyVelocity") then
                      local bodyVelocity = Instance.new("BodyVelocity")
                      bodyVelocity.Velocity = velocity
                      bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                      bodyVelocity.Parent = root
                      root.CanCollide = false
                   end
                end
             else
                for _, descendant in pairs(model:GetDescendants()) do
                   if descendant:IsA("BasePart") then
                      descendant:BreakJoints()
                      descendant.CanCollide = false
                   end
                end

                if not part:FindFirstChild("BodyVelocity") then
                   local bodyVelocity = Instance.new("BodyVelocity")
                   bodyVelocity.Velocity = velocity
                   bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                   bodyVelocity.Parent = part
                   part.CanCollide = false
                end
             end
          end

          for _, obj in pairs(workspace:GetDescendants()) do
             if obj:IsA("BasePart") and not obj.Anchored then
                obj.Touched:Connect(function(hit)
                   if hit and hit:IsDescendantOf(player.Character) then
                      makeFly(obj)
                   end
                end)
             end
          end

          workspace.DescendantAdded:Connect(function(obj)
             if obj:IsA("BasePart") and not obj.Anchored then
                obj.Touched:Connect(function(hit)
                   if hit and hit:IsDescendantOf(player.Character) then
                      makeFly(obj)
                   end
                end)
             end
          end)
       end
    })
local VERSION = "QuietCityHub v1.1.42"
    -- notify Rayfield
    Rayfield:Notify({
       Title = "loaded",
       Content = "the hub has loaded, "..key.. "\n" .. " here is the latest token".."\n".."and ".."\n".." version:".. VERSION,
       Duration = 6.5,
       Image = img2,
    })
	
	game.Players.PlayerAdded:Connect(function(player)
    Rayfield:Notify({
        Title = "Player Joined",
        Content = player.Name .. " has joined the game!",
        Duration = 5,
        Image = img2,
    })
end)

	
end -- if Rayfield
