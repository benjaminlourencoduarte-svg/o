function loadLuma_Bendy_Script_Hub()
	local ui = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()-- creating the library	
	local window = ui:CreateWindow("bendy and the ink machine-luma_hub") -- use this to create a window	
	local main = window:Tab("devil duck scripts") -- use this to create a tab in the window	
	main:Button("black hole", function()
		game.Players.LocalPlayer.Character:FindFirstChild("Evil Duck").Parent = game.Players.LocalPlayer.Character
		wait(0.5)
		local function findHumanoids(target)
			local humanoids = {}
			for _, descendant in ipairs(target:GetDescendants()) do
				if descendant:IsA("Humanoid") and descendant.Parent ~= game.Players.LocalPlayer.Character then
					table.insert(humanoids, descendant)
				end
			end
			return humanoids
		end

		local function pullHumanoids(target)
			local humanoids = findHumanoids(target)
			for _, humanoid in ipairs(humanoids) do
				local args = {
					[1] = humanoid.RootPart
				}
				game:GetService("Players").LocalPlayer.Character:FindFirstChild("Evil Duck").Pull:FireServer(unpack(args))
			end
		end

		while wait() do
			pullHumanoids(workspace) 
		end
	end)
	main:Button("kill all", function()
		game.Players.LocalPlayer.Character:FindFirstChild("Evil Duck").Parent = game.Players.LocalPlayer.Character
		wait(0.5)
		local function findHumanoids(target)
			local humanoids = {}
			for _, descendant in ipairs(target:GetDescendants()) do
				if descendant:IsA("Humanoid") and descendant.Parent ~= game.Players.LocalPlayer.Character then
					table.insert(humanoids, descendant)
				end
			end
			return humanoids
		end

		local function pullHumanoids(target)
			local humanoids = findHumanoids(target)
			for _, humanoid in ipairs(humanoids) do
				local args = {
				}
				args.h= humanoid.RootPart
				local evilduck=game.Players.LocalPlayer.Character["Evil Duck"].Handle
				firetouchinterest(evilduck, args.h, 0)
				firetouchinterest(evilduck, args.h, 1)
			end
		end

		while wait() do
			pullHumanoids(workspace) 
		end
	end)
	main:Button("fly all", function()
		game.Players.LocalPlayer.Character:FindFirstChild("Evil Duck").Parent = game.Players.LocalPlayer.Character
		wait(0.5)
		local function findHumanoids(target)
			local humanoids = {}
			for _, descendant in ipairs(target:GetDescendants()) do
				if descendant:IsA("Humanoid") and descendant.Parent ~= game.Players.LocalPlayer.Character then
					table.insert(humanoids, descendant)
				end
			end
			return humanoids
		end

		local function pullHumanoids(target)
			local humanoids = findHumanoids(target)
			for _, humanoid in ipairs(humanoids) do
				local args = {
					[1] = humanoid.RootPart
				}
				game:GetService("Players").LocalPlayer.Character:FindFirstChild("Evil Duck").Pull:FireServer(unpack(args))
			end
		end


		pullHumanoids(workspace) 
		local lp=game.Players.LocalPlayer
		local char=lp.Character
		char.Humanoid.Health = 0

	end)
	local moddedTab=window:Tab("modded bendy")
	moddedTab:Button("uncanny bombs domain expansion", function()
		local ohInstance1 = game:GetService("Players").LocalPlayer
		local ohString2 = "7817341182"
		local ohString3 = "1"
		local ohString4 = "0"

		game:GetService("Players").LocalPlayer.PlayerGui.Radio.Remote:FireServer(ohInstance1, ohString2, ohString3, ohString4)
		wait(1)

		local function spawnPlantSphere(centerPosition, radius, plantType, numPlants)
			local goldenRatio = (1 + math.sqrt(5)) / 2
			local angleIncrement = 2 * math.pi * goldenRatio -- Use golden ratio for better distribution

			for i = 1, numPlants do
				local angle = angleIncrement * i
				local phi = math.acos(1 - 2 * (i - 1) / (numPlants - 1))
				local x = radius * math.sin(phi) * math.cos(angle)
				local y = radius * math.sin(phi) * math.sin(angle)
				local z = radius * math.cos(phi)
				local position = centerPosition + Vector3.new(x, y, z) -- Use Vector3 addition for position

				local args = {
					[1] = position,
					[2] = plantType
				}

				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
			end
		end

		local player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local torso = char:WaitForChild("Torso")

		for i = 1, 2 do
			local radius = 80 * (i * 1.5)
			local plantType = "supercanny"
			local numPlants = 300

			spawnPlantSphere(torso.Position, radius, plantType, numPlants) 
		end

		local ohInstance1 = game:GetService("Players").LocalPlayer
		local ohString2 = "7817367014"
		local ohString3 = "1"
		local ohString4 = "1"

		game:GetService("Players").LocalPlayer.PlayerGui.Radio.Remote:FireServer(ohInstance1, ohString2, ohString3, ohString4)
		wait(0.5)
		game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Detonate:FireServer()
	end)
	moddedTab:Button(" uncanny bombs wide lazer beam tools", function()
		local tool = Instance.new("Tool")
		tool.Name = "Wide Lazer Beam"
		tool.RequiresHandle = false

		tool.Activated:Connect(function()
			local player = game.Players.LocalPlayer
			local char = player.Character or player.CharacterAdded:Wait()
			local hu = char.Humanoid
			local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
			local playerForward = humanoidRootPart.CFrame.LookVector
			local startPos = humanoidRootPart.Position + 20 * playerForward
			local playerCFrame = humanoidRootPart.CFrame

			local numUzumaki = 64
			local spacing = 10
			local sideOffset = 20

			for i = 1, numUzumaki do
				local position = startPos + ((i - 1) * spacing * playerForward)
				local args = {
					[1] = position,
					[2] = "uncanny"
				}
				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
			end

			for i = 1, numUzumaki do
				local leftPos = startPos - playerCFrame:VectorToWorldSpace(Vector3.new(sideOffset, 0, 0)) + ((i - 1) * spacing * playerForward)
				local args = {
					[1] = leftPos,
					[2] = "uncanny"
				}
				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
			end

			for i = 1, numUzumaki do
				local rightPos = startPos + playerCFrame:VectorToWorldSpace(Vector3.new(sideOffset, 0, 0)) + ((i - 1) * spacing * playerForward)
				local args = {
					[1] = rightPos,
					[2] = "uncanny"
				}
				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
			end
			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Detonate:FireServer()
		end)

		tool.Parent = game.Players.LocalPlayer.Backpack

		local tool = Instance.new("Tool")
		tool.Name = "Wide Lazer Beam+"
		tool.RequiresHandle = false

		tool.Activated:Connect(function()
			local player = game.Players.LocalPlayer
			local char = player.Character or player.CharacterAdded:Wait()
			local hu = char.Humanoid
			local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
			local playerForward = humanoidRootPart.CFrame.LookVector
			local startPos = humanoidRootPart.Position + 55 * playerForward
			local playerCFrame = humanoidRootPart.CFrame

			local numUzumaki = 48
			local spacing = 30
			local sideOffset = 45

			for i = 1, numUzumaki do
				local position = startPos + ((i - 1) * spacing * playerForward)
				local args = {
					[1] = position,
					[2] = "canny"
				}
				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
			end

			for i = 1, numUzumaki do
				local leftPos = startPos - playerCFrame:VectorToWorldSpace(Vector3.new(sideOffset, 0, 0)) + ((i - 1) * spacing * playerForward)
				local args = {
					[1] = leftPos,
					[2] = "canny"
				}
				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
			end

			for i = 1, numUzumaki do
				local rightPos = startPos + playerCFrame:VectorToWorldSpace(Vector3.new(sideOffset, 0, 0)) + ((i - 1) * spacing * playerForward)
				local args = {
					[1] = rightPos,
					[2] = "canny"
				}
				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
			end
			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Detonate:FireServer()
		end)

		tool.Parent = game.Players.LocalPlayer.Backpack

		local tool = Instance.new("Tool")
		tool.Name = "Wide Lazer Beam++"
		tool.RequiresHandle = false

		tool.Activated:Connect(function()
			local player = game.Players.LocalPlayer
			local char = player.Character or player.CharacterAdded:Wait()
			local hu = char.Humanoid
			local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
			local playerForward = humanoidRootPart.CFrame.LookVector
			local startPos = humanoidRootPart.Position + 130 * playerForward
			local playerCFrame = humanoidRootPart.CFrame

			local numUzumaki = 64
			local spacing = 75
			local sideOffset = 100
			local additionalSideOffset = 50

			for i = 1, numUzumaki do
				local position = startPos + ((i - 1) * spacing * playerForward)
				local args = {
					[1] = position,
					[2] = "supercanny"
				}
				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
			end

			for j = 1, 2 do
				for i = 1, numUzumaki do
					local sidePos = startPos + playerCFrame:VectorToWorldSpace(Vector3.new(sideOffset * j, 0, 0)) + ((i - 1) * spacing * playerForward)
					local args = {
						[1] = sidePos,
						[2] = "supercanny"
					}
					game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))

					local additionalSidePos = startPos + playerCFrame:VectorToWorldSpace(Vector3.new((sideOffset + additionalSideOffset) * j, 0, 0)) + ((i - 1) * spacing * playerForward)
					local args = {
						[1] = additionalSidePos,
						[2] = "supercanny"
					}
					game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
				end
			end

			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Detonate:FireServer()
		end)

	end)

	moddedTab:Button("uncanny Bombs : explode all", function()
		local players = game:GetService("Players"):GetPlayers()

		for _, player in ipairs(players) do
			local tools = player.Backpack:GetChildren()

			for _, tool in ipairs(tools) do
				if tool.Name == "Uncanny Bombs" then
					local function findHumanoids(target)
						local humanoids = {}
						for _, descendant in ipairs(target:GetDescendants()) do
							if descendant:IsA("Humanoid") and descendant.Parent ~= game.Players.LocalPlayer.Character then
								table.insert(humanoids, descendant)
							end
						end
						return humanoids
					end

					local function pullHumanoids(target)
						local humanoids = findHumanoids(target)
						for _, humanoid in ipairs(humanoids) do
							local args = {
								[1] = humanoid.RootPart.Position,
								[2] = "supercanny"
							}

							player.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
						end
					end

					pullHumanoids(workspace)
				elseif player.Character:FindFirstChild("Uncanny Bombs") then
					local function findHumanoids(target)
						local humanoids = {}
						for _, descendant in ipairs(target:GetDescendants()) do
							if descendant:IsA("Humanoid") and descendant.Parent ~= game.Players.LocalPlayer.Character then
								table.insert(humanoids, descendant)
							end
						end
						return humanoids
					end

					local function pullHumanoids(target)
						local humanoids = findHumanoids(target)
						for _, humanoid in ipairs(humanoids) do
							local args = {
								[1] = humanoid.RootPart.Position,
								[2] = "supercanny"
							}

							player.Character:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
						end
					end

					pullHumanoids(workspace)
				end
			end
		end
	end)
	local Tab = window:Tab("scripts")
	Tab:Button("Fly", function()
	-- Cheesy Fly Gui v4 - FULL YELLOW THEME 🧀💛
-- Premium cheese overload, instant noclip off, no drift

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CheesyFlyGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = gethui()

-- Main Frame (tall yellow beast)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 280, 0, 240)
mainFrame.Position = UDim2.new(0.5, -140, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(255, 255, 0)  -- bright yellow glow
stroke.Thickness = 2
stroke.Transparency = 0.4

-- Title (yellow text)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Cheesy Fly Gui"
title.TextColor3 = Color3.fromRGB(255, 255, 0)  -- yellow title
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = mainFrame

-- Close & Minimize
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0, 5)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 50)  -- orange-yellow minimize
minBtn.Text = "−"
minBtn.TextColor3 = Color3.new(1,1,1)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 24
minBtn.Parent = mainFrame
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 8)

-- Speed Box (yellow accents)
local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0.8, 0, 0, 35)
speedBox.Position = UDim2.new(0.1, 0, 0, 60)
speedBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
speedBox.PlaceholderText = "Fly Speed (default 100)"
speedBox.Text = "100"
speedBox.TextColor3 = Color3.fromRGB(255, 255, 0)  -- yellow text
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 18
speedBox.Parent = mainFrame
Instance.new("UICorner", speedBox)
local speedStroke = Instance.new("UIStroke", speedBox)
speedStroke.Color = Color3.fromRGB(255, 220, 0)  -- golden yellow stroke
speedStroke.Thickness = 1

-- Fly Button (yellow when off, green when on)
local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(0.8, 0, 0, 45)
flyBtn.Position = UDim2.new(0.1, 0, 0, 110)
flyBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)  -- yellow/orange base
flyBtn.Text = "Fly [OFF]"
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextSize = 20
flyBtn.Parent = mainFrame
Instance.new("UICorner", flyBtn)

-- Noclip Button
local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0.8, 0, 0, 45)
noclipBtn.Position = UDim2.new(0.1, 0, 0, 165)
noclipBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 0)  -- darker yellow
noclipBtn.Text = "Noclip [OFF]"
noclipBtn.TextColor3 = Color3.new(1,1,1)
noclipBtn.Font = Enum.Font.GothamBold
noclipBtn.TextSize = 20
noclipBtn.Parent = mainFrame
Instance.new("UICorner", noclipBtn)

-- Draggable (same)
local dragging = false
local dragStart, startPos
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)
title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

-- Fly vars
local flying = false
local noclip = false
local speed = 100
local keys = {W = false, A = false, S = false, D = false}
local bv, bg, char, hum, root

local function startFly()
    char = player.Character or player.CharacterAdded:Wait()
    hum = char:WaitForChild("Humanoid")
    root = char:WaitForChild("HumanoidRootPart")
    hum.PlatformStand = true
    
    bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bv.Velocity = Vector3.new(0,0,0)
    bv.Parent = root
    
    bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    bg.P = 15000
    bg.Parent = root
end

local function stopFly()
    if bv then bv:Destroy() bv = nil end
    if bg then bg:Destroy() bg = nil end
    if hum then hum.PlatformStand = false end
end

-- Instant noclip
local function enableNoclip()
    char = player.Character or player.CharacterAdded:Wait()
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
end

local function disableNoclip()
    if not player.Character then return end
    char = player.Character
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = true end
    end
end

-- Buttons
flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    flyBtn.Text = "Fly [" .. (flying and "ON" or "OFF") .. "]"
    flyBtn.BackgroundColor3 = flying and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 200, 0)
    if flying then startFly() else stopFly() end
end)

noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    noclipBtn.Text = "Noclip [" .. (noclip and "ON" or "OFF") .. "]"
    noclipBtn.BackgroundColor3 = noclip and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(200, 150, 0)
    if noclip then enableNoclip() else disableNoclip() end
end)

speedBox.FocusLost:Connect(function(enter)
    if enter then
        local num = tonumber(speedBox.Text)
        if num and num > 0 then speed = num
        else speedBox.Text = tostring(speed) end
    end
end)

minBtn.MouseButton1Click:Connect(function()
    if mainFrame.Size.Y.Offset == 240 then
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 280, 0, 40)}):Play()
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 280, 0, 240)}):Play()
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    stopFly()
    disableNoclip()
    screenGui:Destroy()
end)

-- Movement Loop
RunService.RenderStepped:Connect(function()
    if flying and root then
        local cam = workspace.CurrentCamera
        local moveX = (keys.A and -1 or 0) + (keys.D and 1 or 0)
        local moveZ = (keys.W and -1 or 0) + (keys.S and 1 or 0)
        local moveY = 0
        if UIS:IsKeyDown(Enum.KeyCode.Space) then moveY = moveY + 1 end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then moveY = moveY - 1 end
        
        local hasInput = moveX ~= 0 or moveZ ~= 0 or moveY ~= 0
        
        if hasInput then
            local direction = Vector3.new(moveX, moveY, moveZ)
            local worldDir = (cam.CFrame * direction) - cam.CFrame.Position
            bv.Velocity = worldDir.Unit * speed
        else
            bv.Velocity = Vector3.new(0, 0, 0)
        end
        
        bg.CFrame = cam.CFrame
    end
    
    if noclip and player.Character then
        char = player.Character
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- Keys
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    local kc = input.KeyCode
    if kc == Enum.KeyCode.W then keys.W = true
    elseif kc == Enum.KeyCode.A then keys.A = true
    elseif kc == Enum.KeyCode.S then keys.S = true
    elseif kc == Enum.KeyCode.D then keys.D = true end
end)

UIS.InputEnded:Connect(function(input)
    local kc = input.KeyCode
    if kc == Enum.KeyCode.W then keys.W = false
    elseif kc == Enum.KeyCode.A then keys.A = false
    elseif kc == Enum.KeyCode.S then keys.S = false
    elseif kc == Enum.KeyCode.D then keys.D = false end
end)
	end)
	Tab:Button("coca cola X pro", function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/CocaColaXpro/main/Cola"))()
	end)
	Tab:Button("destroy server", function()
		Lag = wait(3)
		while Lag do
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("ClickDetector") then
					fireclickdetector(v)
				end
			end
		end
	end)
	Tab:Button("antilag", function()
		function lowerGraphics()
			game.Lighting.GlobalShadows = false
			game.Lighting.EnvironmentDiffuseScale = 0
			game.Lighting.EnvironmentSpecularScale = 0
			game.Lighting.Technology = "Legacy"
			game.Lighting.SunRays.Enabled = false
			game.Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
			game.Lighting.ShadowSoftness = 0.5
			local terrain = workspace:FindFirstChildOfClass("Terrain")
			if terrain then
				terrain.WaterWaveSize = 0
				terrain.WaterReflectance = 0
				terrain.WaterTransparency = 0.8
			end
			for _, part in pairs(workspace:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Material = Enum.Material.SmoothPlastic
					part.Reflectance = 0
					part.Transparency = 0.5
				elseif part:IsA("ParticleEmitter") or part:IsA("Trail") or part:IsA("Beam") then
					part.Enabled = false
				elseif part:IsA("Decal") or part:IsA("Texture") then
					part.Transparency = 1
				elseif part:IsA("PointLight") or part:IsA("SpotLight") or part:IsA("SurfaceLight") then
					part.Enabled = false
				elseif part:IsA("BillboardGui") then
					part.Enabled = false
				end
			end
		end
		lowerGraphics()
	end)
	Tab:Button("super ring parts test", function()
		--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local SoundService = game:GetService("SoundService")
		local StarterGui = game:GetService("StarterGui")
		local HttpService = game:GetService("HttpService")

		local LocalPlayer = Players.LocalPlayer

		-- Sound Effects
		local function playSound(soundId)
			local sound = Instance.new("Sound")
			sound.SoundId = "rbxassetid://" .. soundId
			sound.Parent = SoundService
			sound:Play()
			sound.Ended:Connect(function()
				sound:Destroy()
			end)
		end

		-- Play initial sound
		playSound("2865227271")

		-- GUI Creation
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Name = "SuperRingPartsGUI"
		ScreenGui.ResetOnSpawn = false
		ScreenGui.Parent = gethui()

		local MainFrame = Instance.new("Frame")
		MainFrame.Size = UDim2.new(0, 300, 0, 600) -- Increased height for new features
		MainFrame.Position = UDim2.new(0.5, -150, 0.5, -300)
		MainFrame.BorderSizePixel = 0
		MainFrame.Parent = ScreenGui

		-- Make the GUI round
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 20)
		UICorner.Parent = MainFrame

		local Title = Instance.new("TextLabel")
		Title.Size = UDim2.new(1, 0, 0, 40)
		Title.Position = UDim2.new(0, 0, 0, 0)
		Title.Text = "Super Ring Parts V6 by lukas"
		Title.TextColor3 = Color3.fromRGB(0, 0, 0)
		Title.BackgroundColor3 = Color3.fromRGB(0, 204, 204)
		Title.Font = Enum.Font.Fondamento
		Title.TextSize = 22
		Title.Parent = MainFrame

		-- Round the title
		local TitleCorner = Instance.new("UICorner")
		TitleCorner.CornerRadius = UDim.new(0, 20)
		TitleCorner.Parent = Title

		-- NEW: TARGET SELECTION DROPDOWN
		local TargetDropdown = Instance.new("TextButton")
		TargetDropdown.Size = UDim2.new(0.8, 0, 0, 40)
		TargetDropdown.Position = UDim2.new(0.1, 0, 0.1, 0)
		TargetDropdown.Text = "Select Target: Self"
		TargetDropdown.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
		TargetDropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
		TargetDropdown.Font = Enum.Font.Fondamento
		TargetDropdown.TextSize = 16
		TargetDropdown.Parent = MainFrame

		local TargetCorner = Instance.new("UICorner")
		TargetCorner.CornerRadius = UDim.new(0, 10)
		TargetCorner.Parent = TargetDropdown

		-- NEW: EPILEPSY-FREE MODE TOGGLE
		local EpilepsyToggle = Instance.new("TextButton")
		EpilepsyToggle.Size = UDim2.new(0.8, 0, 0, 40)
		EpilepsyToggle.Position = UDim2.new(0.1, 0, 0.2, 0)
		EpilepsyToggle.Text = "Epilepsy Mode: OFF"
		EpilepsyToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		EpilepsyToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
		EpilepsyToggle.Font = Enum.Font.Fondamento
		EpilepsyToggle.TextSize = 16
		EpilepsyToggle.Parent = MainFrame

		local EpilepsyCorner = Instance.new("UICorner")
		EpilepsyCorner.CornerRadius = UDim.new(0, 10)
		EpilepsyCorner.Parent = EpilepsyToggle

		local ToggleButton = Instance.new("TextButton")
		ToggleButton.Size = UDim2.new(0.8, 0, 0, 40)
		ToggleButton.Position = UDim2.new(0.1, 0, 0.3, 0)
		ToggleButton.Text = "Ring Off"
		ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		ToggleButton.Font = Enum.Font.Fondamento
		ToggleButton.TextSize = 18
		ToggleButton.Parent = MainFrame

		-- Round the toggle button
		local ToggleCorner = Instance.new("UICorner")
		ToggleCorner.CornerRadius = UDim.new(0, 10)
		ToggleCorner.Parent = ToggleButton

		-- Configuration table
		local config = {
			radius = 50,
			height = 100,
			rotationSpeed = 10,
			attractionStrength = 1000,
			targetPlayer = "Self", -- NEW: Target player setting
			epilepsyMode = false   -- NEW: Epilepsy-free mode
		}

		-- NEW: TARGET PLAYER VARIABLES
		local currentTarget = LocalPlayer
		local targetPlayers = {"Self"}

		-- POPULATE TARGET LIST
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= LocalPlayer then
				table.insert(targetPlayers, player.Name)
			end
		end

		-- UPDATE TARGET LIST WHEN PLAYERS JOIN/LEAVE
		Players.PlayerAdded:Connect(function(player)
			table.insert(targetPlayers, player.Name)
		end)

		Players.PlayerRemoving:Connect(function(player)
			local index = table.find(targetPlayers, player.Name)
			if index then
				table.remove(targetPlayers, index)
			end
		end)

		-- Save and load functions
		local function saveConfig()
			local configStr = HttpService:JSONEncode(config)
			writefile("SuperRingPartsConfig.txt", configStr)
		end

		local function loadConfig()
			if isfile("SuperRingPartsConfig.txt") then
				local configStr = readfile("SuperRingPartsConfig.txt")
				config = HttpService:JSONDecode(configStr)
			end
		end

		loadConfig()

		-- Function to create control buttons and textboxes
		local function createControl(name, positionY, color, labelText, defaultValue, callback)
			local DecreaseButton = Instance.new("TextButton")
			DecreaseButton.Size = UDim2.new(0.2, 0, 0, 40)
			DecreaseButton.Position = UDim2.new(0.1, 0, positionY, 0)
			DecreaseButton.Text = "-"
			DecreaseButton.BackgroundColor3 = color
			DecreaseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DecreaseButton.Font = Enum.Font.Fondamento
			DecreaseButton.TextSize = 18
			DecreaseButton.Parent = MainFrame

			local IncreaseButton = Instance.new("TextButton")
			IncreaseButton.Size = UDim2.new(0.2, 0, 0, 40)
			IncreaseButton.Position = UDim2.new(0.7, 0, positionY, 0)
			IncreaseButton.Text = "+"
			IncreaseButton.BackgroundColor3 = color
			IncreaseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			IncreaseButton.Font = Enum.Font.Fondamento
			IncreaseButton.TextSize = 18
			IncreaseButton.Parent = MainFrame

			local Display = Instance.new("TextLabel")
			Display.Size = UDim2.new(0.4, 0, 0, 40)
			Display.Position = UDim2.new(0.3, 0, positionY, 0)
			Display.Text = labelText .. ": " .. defaultValue
			Display.BackgroundColor3 = Color3.fromRGB(255, 153, 51)
			Display.TextColor3 = Color3.fromRGB(0, 0, 0)
			Display.Font = Enum.Font.Fondamento
			Display.TextSize = 18
			Display.Parent = MainFrame

			-- Add TextBox for input
			local TextBox = Instance.new("TextBox")
			TextBox.Size = UDim2.new(0.8, 0, 0, 35)
			TextBox.Position = UDim2.new(0.1, 0, positionY + 0.1, 0)
			TextBox.PlaceholderText = "Enter " .. labelText
			TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
			TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.Font = Enum.Font.Fondamento
			TextBox.TextSize = 18
			TextBox.Parent = MainFrame

			local TextBoxCorner = Instance.new("UICorner")
			TextBoxCorner.CornerRadius = UDim.new(0, 10)
			TextBoxCorner.Parent = TextBox

			DecreaseButton.MouseButton1Click:Connect(function()
				local value = tonumber(Display.Text:match("%d+"))
				value = math.max(0, value - 10)
				Display.Text = labelText .. ": " .. value
				callback(value)
				playSound("12221967")
				saveConfig()
			end)

			IncreaseButton.MouseButton1Click:Connect(function()
				local value = tonumber(Display.Text:match("%d+"))
				value = math.min(10000, value + 10)
				Display.Text = labelText .. ": " .. value
				callback(value)
				playSound("12221967")
				saveConfig()
			end)

			TextBox.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					local newValue = tonumber(TextBox.Text)
					if newValue then
						newValue = math.clamp(newValue, 0, 10000)
						Display.Text = labelText .. ": " .. newValue
						TextBox.Text = ""
						callback(newValue)
						playSound("12221967")
						saveConfig()
					else
						TextBox.Text = ""
					end
				end
			end)
		end

		createControl("Radius", 0.4, Color3.fromRGB(153, 153, 0), "Radius", config.radius, function(value)
			config.radius = value
			saveConfig()
		end)

		createControl("Height", 0.6, Color3.fromRGB(153, 0, 153), "Height", config.height, function(value)
			config.height = value
			saveConfig()
		end)

		createControl("RotationSpeed", 0.8, Color3.fromRGB(0, 153, 153), "Rotation Speed", config.rotationSpeed, function(value)
			config.rotationSpeed = value
			saveConfig()
		end)

		createControl("AttractionStrength", 1.0, Color3.fromRGB(153, 0, 0), "Attraction Strength", config.attractionStrength, function(value)
			config.attractionStrength = value
			saveConfig()
		end)

		-- Add minimize button
		local MinimizeButton = Instance.new("TextButton")
		MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
		MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
		MinimizeButton.Text = "-"
		MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
		MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		MinimizeButton.Font = Enum.Font.Fondamento
		MinimizeButton.TextSize = 15
		MinimizeButton.Parent = MainFrame

		-- Round the minimize button
		local MinimizeCorner = Instance.new("UICorner")
		MinimizeCorner.CornerRadius = UDim.new(0, 15)
		MinimizeCorner.Parent = MinimizeButton

		-- Minimize functionality
		local minimized = false
		MinimizeButton.MouseButton1Click:Connect(function()
			minimized = not minimized
			if minimized then
				MainFrame:TweenSize(UDim2.new(0, 300, 0, 40), "Out", "Quad", 0.3, true)
				MinimizeButton.Text = "+"
				for _, child in pairs(MainFrame:GetChildren()) do
					if child:IsA("GuiObject") and child ~= Title and child ~= MinimizeButton then
						child.Visible = false
					end
				end
			else
				MainFrame:TweenSize(UDim2.new(0, 300, 0, 600), "Out", "Quad", 0.3, true)
				MinimizeButton.Text = "-"
				for _, child in pairs(MainFrame:GetChildren()) do
					if child:IsA("GuiObject") then
						child.Visible = true
					end
				end
			end
			playSound("12221967")
		end)

		-- Make GUI draggable
		local dragging
		local dragInput
		local dragStart
		local startPos

		local function update(input)
			local delta = input.Position - dragStart
			MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end

		MainFrame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = MainFrame.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		MainFrame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)

		-- Ring Parts System
		local Workspace = game:GetService("Workspace")

		-- NEW: GET TARGET CHARACTER FUNCTION
		local function getTargetCharacter()
			if config.targetPlayer == "Self" then
				return LocalPlayer.Character
			else
				local targetPlayer = Players:FindFirstChild(config.targetPlayer)
				if targetPlayer and targetPlayer.Character then
					return targetPlayer.Character
				end
			end
			return nil
		end

		local Folder = Instance.new("Folder", Workspace)
		local Part = Instance.new("Part", Folder)
		local Attachment1 = Instance.new("Attachment", Part)
		Part.Anchored = true
		Part.CanCollide = false
		Part.Transparency = 1

		if not getgenv().Network then
			getgenv().Network = {
				BaseParts = {},
				Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
			}

			Network.RetainPart = function(Part)
				if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
					table.insert(Network.BaseParts, Part)
					Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
					Part.CanCollide = false
				end
			end

			local function EnablePartControl()
				LocalPlayer.ReplicationFocus = Workspace
				RunService.Heartbeat:Connect(function()
					sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
					for _, Part in pairs(Network.BaseParts) do
						if Part:IsDescendantOf(Workspace) then
							Part.Velocity = Network.Velocity
						end
					end
				end)
			end

			EnablePartControl()
		end

		local function ForcePart(v)
			if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
				for _, x in next, v:GetChildren() do
					if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
						x:Destroy()
					end
				end
				if v:FindFirstChild("Attachment") then
					v:FindFirstChild("Attachment"):Destroy()
				end
				if v:FindFirstChild("AlignPosition") then
					v:FindFirstChild("AlignPosition"):Destroy()
				end
				if v:FindFirstChild("Torque") then
					v:FindFirstChild("Torque"):Destroy()
				end
				v.CanCollide = false
				local Torque = Instance.new("Torque", v)
				Torque.Torque = Vector3.new(100000, 100000, 100000)
				local AlignPosition = Instance.new("AlignPosition", v)
				local Attachment2 = Instance.new("Attachment", v)
				Torque.Attachment0 = Attachment2
				AlignPosition.MaxForce = 9999999999999999999999999999999
				AlignPosition.MaxVelocity = math.huge
				AlignPosition.Responsiveness = 200
				AlignPosition.Attachment0 = Attachment2
				AlignPosition.Attachment1 = Attachment1
			end
		end

		-- Edits
		local ringPartsEnabled = false

		local function RetainPart(Part)
			if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
				-- NEW: Don't affect target player's character parts
				local targetChar = getTargetCharacter()
				if targetChar and Part:IsDescendantOf(targetChar) then
					return false
				end

				Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
				Part.CanCollide = false
				return true
			end
			return false
		end

		local parts = {}
		local function addPart(part)
			if RetainPart(part) then
				if not table.find(parts, part) then
					table.insert(parts, part)
				end
			end
		end

		local function removePart(part)
			local index = table.find(parts, part)
			if index then
				table.remove(parts, index)
			end
		end

		for _, part in pairs(workspace:GetDescendants()) do
			addPart(part)
		end

		workspace.DescendantAdded:Connect(addPart)
		workspace.DescendantRemoving:Connect(removePart)

		RunService.Heartbeat:Connect(function()
			if not ringPartsEnabled then return end

			local targetChar = getTargetCharacter()
			if not targetChar then return end

			local humanoidRootPart = targetChar:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				local tornadoCenter = humanoidRootPart.Position
				for _, part in pairs(parts) do
					if part.Parent and not part.Anchored then
						local pos = part.Position
						local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
						local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
						local newAngle = angle + math.rad(config.rotationSpeed)
						local targetPos = Vector3.new(
							tornadoCenter.X + math.cos(newAngle) * math.min(config.radius, distance),
							tornadoCenter.Y + (config.height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / config.height)))),
							tornadoCenter.Z + math.sin(newAngle) * math.min(config.radius, distance)
						)
						local directionToTarget = (targetPos - part.Position).unit
						part.Velocity = directionToTarget * config.attractionStrength
					end
				end
			end
		end)

		-- NEW: TARGET SELECTION FUNCTIONALITY
		local targetIndex = 1
		TargetDropdown.MouseButton1Click:Connect(function()
			targetIndex = (targetIndex % #targetPlayers) + 1
			config.targetPlayer = targetPlayers[targetIndex]
			TargetDropdown.Text = "Select Target: " .. config.targetPlayer
			playSound("12221967")
			saveConfig()
		end)

		-- NEW: EPILEPSY MODE FUNCTIONALITY
		EpilepsyToggle.MouseButton1Click:Connect(function()
			config.epilepsyMode = not config.epilepsyMode
			EpilepsyToggle.Text = "Epilepsy Mode: " .. (config.epilepsyMode and "ON" or "OFF")
			EpilepsyToggle.BackgroundColor3 = config.epilepsyMode and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
			playSound("12221967")
			saveConfig()
		end)

		-- Button functionality
		ToggleButton.MouseButton1Click:Connect(function()
			ringPartsEnabled = not ringPartsEnabled
			ToggleButton.Text = ringPartsEnabled and "Tornado On" or "Tornado Off"
			ToggleButton.BackgroundColor3 = ringPartsEnabled and Color3.fromRGB(50, 205, 50) or Color3.fromRGB(160, 82, 45)
			playSound("12221967")
		end)

		-- Get player thumbnail
		local userId = Players:GetUserIdFromNameAsync("Robloxlukasgames")
		local thumbType = Enum.ThumbnailType.HeadShot
		local thumbSize = Enum.ThumbnailSize.Size420x420
		local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

		StarterGui:SetCore("SendNotification", {
			Title = "Hey",
			Text = "Enjoy the Script!",
			Icon = content,
			Duration = 5
		})

		StarterGui:SetCore("SendNotification", {
			Title = "NEW FEATURES",
			Text = "Target other players + Epilepsy-free mode!",
			Icon = content,
			Duration = 5
		})

		-- MODIFIED: EPILEPSY-FREE BACKGROUND EFFECT
		local hue = 0
		RunService.Heartbeat:Connect(function()
			if config.epilepsyMode then
				-- Epilepsy-free: Slow, smooth color transitions
				hue = (hue + 0.001) % 1
				MainFrame.BackgroundColor3 = Color3.fromHSV(hue, 0.7, 0.8) -- Muted colors
			else
				-- Original fast rainbow effect
				hue = (hue + 0.01) % 1
				MainFrame.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
			end
		end)

		-- MODIFIED: EPILEPSY-FREE TEXT EFFECT
		local textHue = 0
		RunService.Heartbeat:Connect(function()
			if config.epilepsyMode then
				-- Epilepsy-free: Static or very slow color change
				textHue = (textHue + 0.0005) % 1
				Title.TextColor3 = Color3.fromHSV(textHue, 0.8, 0.9)
			else
				-- Original fast rainbow text
				textHue = (textHue + 0.01) % 1
				Title.TextColor3 = Color3.fromHSV(textHue, 1, 1)
			end
		end)

		-- [REST OF YOUR BUTTONS REMAIN UNCHANGED - Fly Gui, No Fall Damage, etc.]

		-- Add your existing buttons here (Fly Gui, No Fall Damage, Noclip, etc.)
		-- They remain exactly as you had them...

		print("🎯 MODIFIED RING SCRIPT LOADED!")
		print("💫 NEW FEATURES:")
		print("   - Target other players with the ring")
		print("   - Epilepsy-free mode for smoother visuals")
		print("   - Safe for extended use")
	end)
	Tab:Button("Vertex X Pro bendy and the ink machine", function()
		local Luna = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/luna", true))()
		local Window = Luna:CreateWindow({
			Name = "Vertex X Pro | bendy and the ink machine", -- This Is Title Of Your Window
			Subtitle = nil, -- A Gray Subtitle next To the main title.
			LogoID = "82795327169782", -- The Asset ID of your logo. Set to nil if you do not have a logo for Luna to use.
			LoadingEnabled = true, -- Whether to enable the loading animation. Set to false if you do not want the loading screen or have your own custom one.
			LoadingTitle = "Luna Interface Suite", -- Header for loading screen
			LoadingSubtitle = "by Nebula Softworks", -- Subtitle for loading screen

			ConfigSettings = {
				RootFolder = nil, -- The Root Folder Is Only If You Have A Hub With Multiple Game Scripts and u may remove it. DO NOT ADD A SLASH
				ConfigFolder = "Big Hub" -- The Name Of The Folder Where Luna Will Store Configs For This Script. DO NOT ADD A SLASH
			},

			KeySystem = false, -- As Of Beta 6, Luna Has officially Implemented A Key System!
			KeySettings = {
				Title = "Luna Example Key",
				Subtitle = "Key System",
				Note = "Best Key System Ever! Also, Please Use A HWID Keysystem like Pelican, Luarmor etc. that provide key strings based on your HWID since putting a simple string is very easy to bypass",
				SaveInRoot = false, -- Enabling will save the key in your RootFolder (YOU MUST HAVE ONE BEFORE ENABLING THIS OPTION)
				SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
				Key = {"Example Key"}, -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
				SecondAction = {
					Enabled = true, -- Set to false if you do not want a second action,
					Type = "Link", -- Link / Discord.
					Parameter = "" -- If Type is Discord, then put your invite link (DO NOT PUT DISCORD.GG/). Else, put the full link of your key system here.
				}
			}
		})
		Window:CreateHomeTab({
			SupportedExecutors = {"Delta", "Fluxus", "Codex", "Cryptic", "Vegax", "Trigon", "Synapse X", "Script-Ware", "KRNL", "Seliware", "Solara", "Xeno", "ZORARA", "Luna", "Nihon", "JJsploit", "AWP", "Wave", "Ronix"},
			DiscordInvite = "nodisc.cc/Hu4ErF2",
			Icon = 84442594910404,
		})
		local Tab = Window:CreateTab({
			Name = "Scripts",
			Icon = "view_in_ar",
			ImageSource = "Material",
			ShowTitle = true -- This will determine whether the big header text in the tab will show
		})
		local Button = Tab:CreateButton({
			Name = "Bendy Hub X",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Bendy/main/BendyHubX"))()
			end
		})
		local Button = Tab:CreateButton({
			Name = "crash game",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				_G.Lag =wait(1)
				while _G.Lag do
					for i,v in pairs(workspace:GetDescendants()) do
						if v:IsA("ClickDetector") then
							fireclickdetector(v)
						end
					end
				end
			end
		})
		local con
		local Button = Tab:CreateButton({
			Name = "kill all",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local range = 1000
				local player = game:GetService("Players").LocalPlayer
				con=game:GetService("RunService").RenderStepped:Connect(function()
					local p = game.Players:GetPlayers()
					for i = 2, #p do local v = p[i].Character
						local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
						if tool and tool:FindFirstChild("Handle") then
							tool:Activate()
							for i,v in next, v:GetChildren() do
								if v:IsA("BasePart") then
									firetouchinterest(tool.Handle,v,0)
									firetouchinterest(tool.Handle,v,1)
								end
							end
						end
					end
				end)	
			end
		})
		local Button = Tab:CreateButton({
			Name = "stop kill all (rejoin)",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				if con then
					con:Disconnect()
					con = nil
					function rejoin()
						game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
					end
					rejoin()
				end
			end
		})
		local Button = Tab:CreateButton({
			Name = "get sword",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				last_pick_sin_mrazy = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 

				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15, 52, -34)
				task.wait()
				local player = game.Players.LocalPlayer
				local character = player.Character or player.CharacterAdded:Wait()
				local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
				local actionRadius = 1.5



				for i, v in pairs(workspace:GetDescendants()) do
					if v:IsA("ClickDetector") then
						local objectPosition = v.Parent.Position
						local playerPosition = humanoidRootPart.Position
						local distance = (objectPosition - playerPosition).magnitude 

						if distance <= actionRadius then
							fireclickdetector(v)
						end
					end
				end
				task.wait(0.1)
				for i = 1, 15 do
					wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11, 52, -54)
				end
				task.wait(0.1)
				game. Players.LocalPlayer.Character.HumanoidRootPart.CFrame = last_pick_sin_mrazy
			end
		})

		local Button = Tab:CreateButton({
			Name = "instant proximity prompt",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
			--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
				for _, prom in next, workspace:GetDescendants() do
					if prom:IsA("ProximityPrompt") then
						prom.PromptButtonHoldBegan:Connect(function()
							if prom.HoldDuration <= 0 then return end
							fireproximityprompt(prom, 0)
						end)
					end
				end

				workspace.DescendantAdded:Connect(function(class)
					if class:IsA("ProximityPrompt") then
						class.PromptButtonHoldBegan:Connect(function()
							if class.HoldDuration <= 0 then return end
							fireproximityprompt(class, 0)
						end)
					end
				end)
			end
		})

		local Button = Tab:CreateButton({
			Name = "delete unanchored parts tool",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local lp = game.Players.LocalPlayer
				local mouse = lp:GetMouse()

				local ft = Instance.new("Tool")
				ft.Name = "Focus"
				ft.RequiresHandle = false
				ft.Parent = lp.Backpack
				ft.Activated:Connect(function()
					local obj = mouse.Target
					if obj:IsA("BasePart") or obj:IsA("Part") or obj:IsA("MeshPart") or obj:IsA("CornerWedgePart") or obj:IsA("TrussPart") or obj:IsA("WedgePart") then
						if not obj.Anchored then
							local bambam = Instance.new("BodyAngularVelocity")
							bambam.Name = "BAM BAM AHAHHAHAHHAHAH"
							bambam.Parent = obj
							bambam.AngularVelocity = Vector3.new(99999999,99999999,99999999)
							bambam.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
							bambam.P = math.huge
						end
					end
				end)
			end
		})
		local Tab = Window:CreateTab({
			Name = "Mass Unanchored parts",
			Icon = "view_in_ar",
			ImageSource = "Material",
			ShowTitle = true -- This will determine whether the big header text in the tab will show
		})
		local Button = Tab:CreateButton({
			Name = "lightweight parts",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local Players = game:GetService("Players")
				local function isPartOfPlayerCharacter(part)
					for _, player in ipairs(Players:GetPlayers()) do
						local character = player.Character
						if character and part:IsDescendantOf(character) then
							return true
						end
					end
					return false
				end

				for _, part in ipairs(workspace:GetDescendants()) do
					if part:IsA("BasePart") and not isPartOfPlayerCharacter(part) then
						part.CustomPhysicalProperties = PhysicalProperties.new(-9e9999, 9e9999, 0, 0, 0)
					end
				end
			end
		})
		local Button = Tab:CreateButton({
			Name = " very Heavy Parts",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local Players = game:GetService("Players")
				local function isPartOfPlayerCharacter(part)
					for _, player in ipairs(Players:GetPlayers()) do
						local character = player.Character
						if character and part:IsDescendantOf(character) then
							return true
						end
					end
					return false
				end

				for _, part in ipairs(workspace:GetDescendants()) do
					if part:IsA("BasePart") and not isPartOfPlayerCharacter(part) then
						part.CustomPhysicalProperties = PhysicalProperties.new(9e999, 0, 0, 9e999, 9e999)
					end
				end
			end
		})
		local Button = Tab:CreateButton({
			Name = "Normal Parts",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local Players = game:GetService("Players")
				local function isPartOfPlayerCharacter(part)
					for _, player in ipairs(Players:GetPlayers()) do
						local character = player.Character
						if character and part:IsDescendantOf(character) then
							return true
						end
					end
					return false
				end

				for _, part in ipairs(workspace:GetDescendants()) do
					if part:IsA("BasePart") and not isPartOfPlayerCharacter(part) then
						part.CustomPhysicalProperties = PhysicalProperties.new(1, 1, 1, 1, 1)
					end
				end
			end
		})
		local Tab = Window:CreateTab({
			Name = "Gravity",
			Icon = "view_in_ar",
			ImageSource = "Material",
			ShowTitle = true -- This will determine whether the big header text in the tab will show
		})
		local Button = Tab:CreateButton({
			Name = "0 grav",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				workspace.Gravity = 0
			end
		})
		local Button = Tab:CreateButton({
			Name = "999 grav",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				workspace.Gravity = 999
			end
		})
		local Button = Tab:CreateButton({
			Name = "normal grav",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				workspace.Gravity = 196.2
			end
		})
		local Tab = Window:CreateTab({
			Name = "modded",
			Icon = "view_in_ar",
			ImageSource = "Material",
			ShowTitle = true -- This will determine whether the big header text in the tab will show
		})
		local Button = Tab:CreateButton({
			Name = "kill all (among us)",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
					if player ~= game:GetService("Players").LocalPlayer then
						local lp=game:GetService("Players").LocalPlayer
						local char = player.Character
						if char then
							local hrp=char:FindFirstChild("HumanoidRootPart")
							if hrp then
								hrp.CFrame = lp.Character.HumanoidRootPart.CFrame
								for _, part in ipairs(lp.Character:GetDescendants()) do	
									if part:IsA("BasePart") then
										firetouchinterest(part, hrp, 0)
										firetouchinterest(part, hrp, 1)
									end
								end
							end
						end
					end
				end
			end
		})
		local Button = Tab:CreateButton({
			Name = "infect all (virus infection)",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
					if player ~= game:GetService("Players").LocalPlayer then
						local lp=game:GetService("Players").LocalPlayer
						local char = player.Character
						if char then
							local hrp=char:FindFirstChild("HumanoidRootPart")
							if hrp then
								hrp.CFrame = lp.Character.HumanoidRootPart.CFrame
								for _, part in ipairs(lp.Character:GetDescendants()) do	
									if part:IsA("BasePart") then
										firetouchinterest(part, hrp, 0)
										firetouchinterest(part, hrp, 1)
									end
								end
							end
						end
					end
				end
			end
		})
		local Tab = Window:CreateTab({
			Name = "Tools modification",
			Icon = "view_in_ar",
			ImageSource = "Material",
			ShowTitle = true -- This will determine whether the big header text in the tab will show
		})

		local Button = Tab:CreateButton({
			Name = "break game",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				while game:GetService("RunService").RenderStepped:wait() do
					game:GetService("Players").LocalPlayer.Character.Timestop.Stop:FireServer()
				end
			end
		})
		local Button = Tab:CreateButton({
			Name = "break game v2",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local LP = game.Players.LocalPlayer
				repeat wait() until LP.Character
				for i,v in pairs(LP.Backpack:GetChildren()) do
					if v.Name == "Winning Knife" then
						v.Parent = LP.Character
					end
				end
				for _, npc in ipairs(workspace:GetChildren()) do
					local args = {
						[1] = npc
					}

					game:GetService("Players").LocalPlayer.Character:FindFirstChild("Winning Knife").Throw:FireServer(unpack(args))
				end
			end

		})
		local Label = Tab:CreateLabel({
			Text = "WARNING: YOU NEED TO HAVE TOOLS",
			Style = 3 -- Luna Labels Have 3 Styles : A Basic Label, A Green Information Label and A Red Warning Label. Look At The Following Image For More Details
		})
		local Button = Tab:CreateButton({
			Name = "uncanny Bombs domain expansion",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local ohInstance1 = game:GetService("Players").LocalPlayer
				local ohString2 = "7817341182"
				local ohString3 = "1"
				local ohString4 = "0"

				game:GetService("Players").LocalPlayer.PlayerGui.Radio.Remote:FireServer(ohInstance1, ohString2, ohString3, ohString4)
				wait(1)

				local function spawnPlantSphere(centerPosition, radius, plantType, numPlants)
					local goldenRatio = (1 + math.sqrt(5)) / 2
					local angleIncrement = 2 * math.pi * goldenRatio -- Use golden ratio for better distribution

					for i = 1, numPlants do
						local angle = angleIncrement * i
						local phi = math.acos(1 - 2 * (i - 1) / (numPlants - 1))
						local x = radius * math.sin(phi) * math.cos(angle)
						local y = radius * math.sin(phi) * math.sin(angle)
						local z = radius * math.cos(phi)
						local position = centerPosition + Vector3.new(x, y, z) -- Use Vector3 addition for position

						local args = {
							[1] = position,
							[2] = plantType
						}

						game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Plant:FireServer(unpack(args))
					end
				end

				local player = game.Players.LocalPlayer
				local char = player.Character or player.CharacterAdded:Wait()
				local torso = char:WaitForChild("Torso")

				for i = 1, 2 do
					local radius = 80 * (i * 1.5)
					local plantType = "supercanny"
					local numPlants = 300

					spawnPlantSphere(torso.Position, radius, plantType, numPlants) 
				end

				local ohInstance1 = game:GetService("Players").LocalPlayer
				local ohString2 = "7817367014"
				local ohString3 = "1"
				local ohString4 = "1"

				game:GetService("Players").LocalPlayer.PlayerGui.Radio.Remote:FireServer(ohInstance1, ohString2, ohString3, ohString4)
				wait(0.5)
				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Uncanny Bombs").Detonate:FireServer()
			end
		})
		local Button = Tab:CreateButton({
			Name = "wise tree : god of florest",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local player = game.Players.LocalPlayer

				local currentMode = 1

				local function onItemActivated1()
					local player = game.Players.LocalPlayer
					local char = player.Character or player.CharacterAdded:Wait()
					local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
					local playerForward = humanoidRootPart.CFrame.LookVector
					local startPos = humanoidRootPart.Position + (5 * playerForward)

					local numUzumaki = 75
					local spacing = 3

					for i = 1, numUzumaki do
						local args = {
							[1] = startPos + ((i - 1) * spacing * Vector3.new(playerForward.X, 0, playerForward.Z))
						}
						game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
					end
				end

				local function onItemActivated2()
					local mouse = game:GetService("Players").LocalPlayer:GetMouse()
					local clickPosition = mouse.Hit.Position

					local function spawnUzumakiCircle(centerPosition)
						local radius = 10
						local numUzumaki = 32

						for i = 1, numUzumaki do
							local angle = (i - 1) * 2 * math.pi / numUzumaki
							local x = centerPosition.X + radius * math.cos(angle)
							local y = centerPosition.Y
							local z = centerPosition.Z + radius * math.sin(angle)
							local spawnPosition = Vector3.new(x, y, z)

							local args = {
								[1] = spawnPosition
							}

							game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
						end
					end

					spawnUzumakiCircle(clickPosition)
				end

				local function onItemActivated3()
					local player = game.Players.LocalPlayer
					local playerPosition = player.Character.HumanoidRootPart.Position

					local function spawnUzumakiCircle(centerPosition)
						local radius = 10
						local numUzumaki = 8

						for i = 1, numUzumaki do
							local angle = (i - 1) * 2 * math.pi / numUzumaki
							local x = centerPosition.X + radius * math.cos(angle)
							local y = centerPosition.Y
							local z = centerPosition.Z + radius * math.sin(angle)

							local args = {
								[1] = Vector3.new(x, y, z)
							}

							game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
						end
					end

					spawnUzumakiCircle(playerPosition)
					wait(0.5)
					game:GetService("RunService").Heartbeat:Wait()
					local function spawnUzumakiCircle(centerPosition)
						local radius = 30
						local numUzumaki = 16

						for i = 1, numUzumaki do
							local angle = (i - 1) * 2 * math.pi / numUzumaki
							local x = centerPosition.X + radius * math.cos(angle)
							local y = centerPosition.Y
							local z = centerPosition.Z + radius * math.sin(angle)

							local args = {
								[1] = Vector3.new(x, y, z)
							}
							game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
						end
					end

					spawnUzumakiCircle(playerPosition)
					wait(0.5)
					game:GetService("RunService").Heartbeat:Wait()
					local function spawnUzumakiCircle(centerPosition)
						local radius = 55
						local numUzumaki = 22

						for i = 1, numUzumaki do
							local angle = (i - 1) * 2 * math.pi / numUzumaki
							local x = centerPosition.X + radius * math.cos(angle)
							local y = centerPosition.Y
							local z = centerPosition.Z + radius * math.sin(angle)

							local args = {
								[1] = Vector3.new(x, y, z)
							}
							game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
						end
					end

					spawnUzumakiCircle(playerPosition)

					wait(0.5)
					game:GetService("RunService").Heartbeat:Wait()
					local function spawnUzumakiCircle(centerPosition)
						local radius = 80
						local numUzumaki = 32

						for i = 1, numUzumaki do
							local angle = (i - 1) * 2 * math.pi / numUzumaki
							local x = centerPosition.X + radius * math.cos(angle)
							local y = centerPosition.Y
							local z = centerPosition.Z + radius * math.sin(angle)

							local args = {
								[1] = Vector3.new(x, y, z)
							}
							game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
						end
					end

					spawnUzumakiCircle(playerPosition)

					wait(0.5)
					game:GetService("RunService").Heartbeat:Wait()
					local function spawnUzumakiCircle(centerPosition)
						local radius = 105
						local numUzumaki = 40

						for i = 1, numUzumaki do
							local angle = (i - 1) * 2 * math.pi / numUzumaki
							local x = centerPosition.X + radius * math.cos(angle)
							local y = centerPosition.Y
							local z = centerPosition.Z + radius * math.sin(angle)

							local args = {
								[1] = Vector3.new(x, y, z)
							}
							game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
						end
					end

					spawnUzumakiCircle(playerPosition)

					wait(0.5)
					game:GetService("RunService").Heartbeat:Wait()
					local function spawnUzumakiCircle(centerPosition)
						local radius = 135
						local numUzumaki = 55

						for i = 1, numUzumaki do
							local angle = (i - 1) * 2 * math.pi / numUzumaki
							local x = centerPosition.X + radius * math.cos(angle)
							local y = centerPosition.Y
							local z = centerPosition.Z + radius * math.sin(angle)

							local args = {
								[1] = Vector3.new(x, y, z)
							}
							game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
						end
					end

					spawnUzumakiCircle(playerPosition)
				end

				local function onItemActivated4()
					local players = game:GetService("Players"):GetPlayers()
					for _, player in ipairs(players) do
						if player ~= game.Players.LocalPlayer and player.Character then
							for i = 1, 20 do
								local args = {
									[1] = player.Character.HumanoidRootPart.Position
								}
								game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wise Mystical Tree").Create:FireServer(unpack(args))
							end
						end
					end
				end

				local function setMode(mode)
					currentMode = mode
					print("Operating mode: " .. mode)
				end

				player.Chatted:Connect(function(message)
					if message == "/toolmode1" then
						setMode(1)
					elseif message == "/toolmode2" then
						setMode(2)
					elseif message == "/toolmode3" then
						setMode(3)
					elseif message == "/toolmode4" then
						setMode(4)
					end
				end)

				player.Character.ChildAdded:Connect(function(item)
					if item.Name == "Wise Mystical Tree" then
						item.Activated:Connect(function()
							if currentMode == 1 then
								onItemActivated1()
							elseif currentMode == 2 then
								onItemActivated2()
							elseif currentMode == 3 then
								onItemActivated3()
							elseif currentMode == 4 then
								onItemActivated4()
							end
						end)
					end
				end)
			end
		})
		local Button = Tab:CreateButton({
			Name = "drop all",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local player = game:GetService("Players").LocalPlayer
				local backpack = player.Backpack
				for _, item in ipairs(backpack:GetChildren()) do
					item.Parent = workspace
					for i,gtr in ipairs(item:GetChildren()) do
						if gtr:IsA("BasePart") then
							gtr.CanCollide = true
							gtr.Anchored = false
							gtr.Transparency = 0

						end

					end
				end
			end
		})
		local Tab = Window:CreateTab({
			Name = "map modification",
			Icon = "view_in_ar",
			ImageSource = "Material",
			ShowTitle = true -- This will determine whether the big header text in the tab will show
		})
		local Button = Tab:CreateButton({
			Name = "paint map (requires paint slap thingy)",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local player = game:GetService("Players").LocalPlayer
				local backpack = player.Backpack
				for _, item in ipairs(backpack:GetChildren()) do
					if item:IsA("Tool") then
						item.Parent = player.Character
					end
				end
				local hrp=player.Character:WaitForChild("HumanoidRootPart")
				for i,v in ipairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid")  and not v.Parent:FindFirstChild("Humanoid") then
						hrp.CFrame = v.CFrame
						do
							for i,vGef in pairs(player.Character:GetChildren()) do
								if vGef:IsA("Tool") then
									for i,v in pairs(vGef:GetChildren()) do
										if v:IsA("BasePart") then
											firetouchinterest(vGef, v, 0)
											firetouchinterest(vGef, v, 1)
										end
									end
								end
							end
						end
					end
				end


			end
		})
		local Button = Tab:CreateButton({
			Name = "reset character",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character
				char.Parent = nil

				wait(0.1)
				char.Parent = workspace
				char:breakJoints()
				char:ClearAllChildren()
			end
		})
		local Button = Tab:CreateButton({
			Name = "delete map",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character
				for i,v in ipairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid")  and not v.Parent:FindFirstChild("Humanoid") then
						local weld = Instance.new("WeldConstraint",char.HumanoidRootPart)
						weld.Part0 = v
						humroot = char.HumanoidRootPart
						weld.Part1 = humroot
						v.Anchored = false
						humroot.CFrame = CFrame.new(0,500000,0)
						local bvel=Instance.new("BodyVelocity",v)
						bvel.Velocity = Vector3.new(0,-500,0)
						v.CanCollide = false
						v.CanTouch = false
					end
				end
			end
		})
		local Button = Tab:CreateButton({
			Name = "godmode",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character
				for i,v in ipairs(char:GetChildren()) do
					if v:IsA("BasePart") then
						v.CanTouch= false
					end
				end
			end
		})
		local invis = false
		local Button = Tab:CreateButton({
			Name = "invis",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				if invis == true then
					return
				end
				invis = true
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character
				local oldCframe = char.HumanoidRootPart.CFrame
				char.HumanoidRootPart.CFrame = CFrame.new(0,9000,0)
				char.HumanoidRootPart.Anchored = true
				local newplrchar=Instance.new("Model",workspace)
				newplrchar.Name = "plrchar_"..tostring(math.random(99999999999999,9999999999),math.random(99999999999999,9999999999))
				local hum=Instance.new("Humanoid",newplrchar)
				hum.WalkSpeed = 20
				hum.JumpPower = 200
				local newtorso=Instance.new("Part",newplrchar)
				newtorso.Name = "Torso"
				newtorso.Size = Vector3.new(2,2,1)
				newtorso.CanCollide = true
				newtorso.CFrame = oldCframe
				local dragg = Instance.new("DragDetector",newtorso)
				local newhead=Instance.new("Part",newplrchar)
				newhead.Name = "Head"
				newhead.Size = Vector3.new(1,1,1)
				newhead.CanCollide = true
				newhead.CFrame = oldCframe
				local dreagg2 = Instance.new("DragDetector",newhead)
				local newweld=Instance.new("WeldConstraint",newtorso)
				newweld.Part0 = newtorso
				newweld.Part1 = newhead
				char.Parent = newplrchar
				char=newplrchar
				local camera=workspace.CurrentCamera
				camera.CameraSubject = newplrchar.Humanoid
				local goal = oldCframe.Position

				local gc___x = CFrame.new(goal)
				camera.Focus = gc___x
			end
		})
		local Button = Tab:CreateButton({
			Name = "uninvis",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				invis = false
				local clickSignal=nil
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character
				char.Humanoid.Health = 0
				char:BreakJoints()
			end
		})
		local Button = Tab:CreateButton({
			Name = "loop godmode",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				local player = game:GetService("Players").LocalPlayer
				local char = player.Character
				spawn(function ()
					while wait(0.01) do
						for i,v in pairs(char:GetDescendants()) do
							if v:IsA("BasePart") then
								v.CanTouch = false
							end
						end
					end
				end)
			end
		})
		walkflinging = true
		local Button = Tab:CreateButton({
			Name = "loop iy walkfling",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				function noclip()
					local player = game:GetService("Players").LocalPlayer
					local char = player.Character
					for i,v in pairs(char:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
				end
				noclip()
				local speaker = game:GetService("Players").LocalPlayer
				local RunService = game:GetService("RunService")
				local function getRoot(character)
					return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("LowerTorso")
				end
				repeat RunService.Heartbeat:Wait()
					local character = speaker.Character
					local root = getRoot(character)
					local vel, movel = nil, 0.1

					while not (character and character.Parent and root and root.Parent) do
						RunService.Heartbeat:Wait()
						character = speaker.Character
						root = getRoot(character)
					end

					vel = root.Velocity
					root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)

					RunService.RenderStepped:Wait()
					if character and character.Parent and root and root.Parent then
						root.Velocity = vel
					end

					RunService.Stepped:Wait()
					if character and character.Parent and root and root.Parent then
						root.Velocity = vel + Vector3.new(0, movel, 0)
						movel = movel * -1
					end
				until walkflinging == false
			end
		})
		local Button = Tab:CreateButton({
			Name = "stop fling",
			Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
			Callback = function()
				walkflinging = false
			end
		})
		Luna:Notification({ 
			Title = "Loaded",
			Icon = "notifications_active",
			ImageSource = "Material",
			Content = "E"
		})
	end)
end
loadLuma_Bendy_Script_Hub()
--[[
-- Now let's fetch and examine the actual code from that URL
local success, result = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Lua-Obfuscation/main/BendyHubX")
end)

if success then
    return "Fetched code successfully. Length: " .. string.len(result) .. " characters"
else
    return "Failed to fetch: " .. tostring(result)
end
]]
if Xeno then
	print("executor:Xeno")
end
local ges = getcustomasset or getsynasset
if ges then
	local x = "https://www.checkpoint.com/wp-content/uploads/remote-access-trojan-rat-definition-icon.jpg"
	local _,result = pcall(function ()
		writefile("TROJAN.BADJOKE.ANDROISIOS.LOL.jpeg", game:HttpGet(x))
	end)
	local asset= ges("TROJAN.BADJOKE.ANDROISIOSLOL.jpeg", x)
	for i,v in pairs (game:GetDescendants()) do
		if v:IsA("ImageLabel") then
			v.Image = asset
		end
	end
end
