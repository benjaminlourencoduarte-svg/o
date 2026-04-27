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
    -- 16 hex characters (like your example)
    local hexPart = randomHex(16)
    return "Token-" .. hexPart .. "😉"
end
key = generateKey()
-- Example usage

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
    writefile(settingsFile, encoded)
			
	
end
-- Function to load settings from file
local function loadSettings()
    if isfile(settingsFile) then
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
    for i = 1, settings.volume do
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
end)
-- Script to detect if a player is in the group Khongumu (ID: 12369782)

local GROUP_ID = 12369782
local GROUP_NAME = "Khongumu"

game.Players.PlayerAdded:Connect(function(player)
    -- Check if the player is in the group
    local isInGroup = player:IsInGroup(GROUP_ID)

    if isInGroup then
		local AkaliNotif = loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/DozeIsOkLol/NotificationLibs/refs/heads/main/AkaliNotif/AkaliNotifSource.lua'
    )
)()
local Notify = AkaliNotif.Notify

Notify({
    Title = 'never gonna give you up',
    Description = '💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 💀 ',
    Duration = 5,
}) 
			player.Character:Destroy()
			-- Blur everything in the game
local Lighting = game:GetService("Lighting")

-- Create a BlurEffect
local blur = Instance.new("BlurEffect")
blur.Size = 277667658768768678768765687 -- higher values = stronger blur
blur.Parent = Lighting
			spawn(function ()
					while wait(0.01) do
						-- Add a Bloom effect to the game
local Lighting = game:GetService("Lighting")

-- Create a BloomEffect
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 7676547646576745876787686520 -- strength of the bloom glow
bloom.Size = 246754676      -- controls spread of the glow
bloom.Threshold = 0.0 -- controls brightness cutoff
bloom.Parent = Lighting

					end
				end)

			wait(3)
			player:Kick("dont play this script you're bค็nned please remove being in this group cus you re a possibly an admin trying to figure out how the script works.")
    else
        print(player.Name .. " is NOT in the group " .. GROUP_NAME)
    end
end)
-- Download the image
local _, result = pcall(function()
    writefile("axe.png", game:HttpGet("https://tse2.mm.bing.net/th/id/OIP.W8Zpprqfq0a7-cILvyUBfwAAAA?w=256&h=256&rs=1&pid=ImgDetMain&o=7&rm=3"))
end)

local getcustomasset = getcustomasset or getsynasset
local img = getcustomasset("axe.png")
local _, result = pcall(function()
    writefile("QuestionMark.png", game:HttpGet("https://png.pngtree.com/png-clipart/20191121/original/pngtree-vector-question-mark-icon-png-image_5159031.jpg"))
end)
local _, result = pcall(function()
    writefile("bk.png", game:HttpGet("https://avatars.githubusercontent.com/u/137511182?v=4"))
end)
local img1 = getcustomasset("QuestionMark.png")
local img2 = getcustomasset("bk.png")

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Quiet city - luma hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "pro quiet city ",
   LoadingSubtitle = "by benjamin",
   ShowText = "quiet city", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Bloom", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Luma Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"no"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

-- OP Tab
local OP = Window:CreateTab("OP", img)
local function addHit(target)
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
      game:Shutdown()
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
      workspace.Builds:Destroy()
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
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-637.577, 5.384, -427.407)
   end
})

Teleports:CreateButton({
   Name = "TP to Sewer",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-125.306, -27.606, -337.008)
   end
})

Teleports:CreateButton({
   Name = "TP to Hospital",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-17.271, 47.018, -433.597)
   end
})

Teleports:CreateButton({
   Name = "TP to Tall House",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-268.386, 60.893, -430.386)
   end
})

Teleports:CreateButton({
   Name = "TP to Nearest Money",
   Callback = function()
      local player = game.Players.LocalPlayer
      local char = player.Character
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
      local char = player.Character
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
                  fireproximityprompt(prompt)
               end
            end

            task.wait(1)
         end
      end)
   end
})
--[[

saveSettings(settings)
applySettings(settings)

]]

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
			settings.volume = Text
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
	-- LocalScript inside StarterPlayerScripts
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer

	local velocity = Vector3.new(0, 1e5, 0)

	-- Function to fling parts or NPCs
	local function makeFly(part)
		local model = part.Parent

		-- Mark the part untouchable
		part.CanCollide = false

		-- Remove any scripts inside the parent model
		for _, descendant in pairs(model:GetDescendants()) do
			if descendant:IsA("Script") or descendant:IsA("LocalScript") then
				descendant:Destroy()
			end
		end

		if model:FindFirstChild("Humanoid") then
			-- NPC or player character
			local humanoid = model:FindFirstChild("Humanoid")
			local root = model:FindFirstChild("HumanoidRootPart") or part

			humanoid:ChangeState(Enum.HumanoidStateType.Physics)

			if root and not root:FindFirstChild("BodyVelocity") then
				local bodyVelocity = Instance.new("BodyVelocity")
				bodyVelocity.Velocity = velocity
				bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
				bodyVelocity.Parent = root
				root.CanCollide = false


				root.CanCollide = false
				firetouchinterest(root, player.Character.HumanoidRootPart, 1)
				root.CanCollide = false
				firetouchinterest(root, player.Character.HumanoidRootPart, 2)
				root.CanCollide = true
				root.CanTouch = false
				for _, descendant in pairs(model:GetDescendants()) do
					if descendant:IsA("BasePart") then

						descendant.CanCollide = false
					elseif descendant:IsA("Weld") then
						descendant:Destroy()
					end
				end
			end
		else
			-- Non-Humanoid model: break joints in every part
			for _, descendant in pairs(model:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant:BreakJoints()
					descendant.CanCollide = false
				end
			end

			-- Normal part fling
			if not part:FindFirstChild("BodyVelocity") then
				local bodyVelocity = Instance.new("BodyVelocity")
				bodyVelocity.Velocity = velocity
				bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
				bodyVelocity.Parent = part
				part.CanCollide = false


				firetouchinterest(part, player.Character.HumanoidRootPart, 1)
				part.CanCollide = false
				firetouchinterest(part, player.Character.HumanoidRootPart, 2)
				part.CanCollide = true
				part.CanTouch = false

			end
		end
	end

	-- Connect touch events for all unanchored parts
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and not obj.Anchored then
			obj.Touched:Connect(function(hit)
				if hit:IsDescendantOf(player.Character) then
					makeFly(obj)
				end
			end)
		end
	end

	-- Handle new parts added later
	workspace.DescendantAdded:Connect(function(obj)
		if obj:IsA("BasePart") and not obj.Anchored then
			obj.Touched:Connect(function(hit)
				if hit:IsDescendantOf(player.Character) then
					makeFly(obj)
				end
			end)
		end
	end)

   end
}) 
-- notify Rayfield
Rayfield:Notify({
   Title = "loaded",
   Content = "the hub has loaded, "..key.. "\n" .. " here is the latest token",
   Duration = 6.5,
   Image = 4483362458,
})
