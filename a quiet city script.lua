local mixaUiLIB = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()
lib = mixaUiLIB
local window = lib:CreateWindow("quiet city-luma_hub")

-- OP tab
main = window:Tab("OP")

-- Unified addHit
local function addHit(target)
	-- Add highlight
	if not target:FindFirstChild("Highlight") then
		local HH = Instance.new("Highlight")
		HH.Parent = target
		HH.Adornee = target
	end

	-- Billboard logic
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
		billboard.Parent = gethui()

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

-- Buttons
main:Button("shutdown (ONLY ON EMERGENCY)", function()
	game:Shutdown()
end)

main:Button("tool esp", function()
	for _, v in pairs(workspace:GetDescendants()) do
		-- Bat models
		if v:IsA("Model") and v:FindFirstChild("Bat") then
			addHit(v)
		end
		-- Money parts (MeshPart)
		if v:IsA("BasePart") and v.Name == "Money" then
			addHit(v)
		end
	end
end)

-- (rest of your buttons: day, no wood, teleports, anti lag, esp, etc. stay the same)



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
main:Button("tp to hospital", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-17.2716656, 47.0188217, -433.597198, -0.752551138, -2.51325094e-08, 0.658533812, 2.71444481e-11, 1, 3.81953598e-08, -0.658533812, 2.87618374e-08, -0.752551138)
end)
main:Button("tp to tall house", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-268.386414, 60.8938217, -430.386017, 0.504252732, -1.42263232e-08, 0.863556147, 3.26849048e-10, 1, 1.62832592e-08, -0.863556147, -7.92862576e-09, 0.504252732)
end)  -- -17.2716656, 47.0188217, -433.597198, -0.752551138, -2.51325094e-08, 0.658533812, 2.71444481e-11, 1, 3.81953598e-08, -0.658533812, 2.87618374e-08, -0.752551138
main:Button("tp to nearest money", function()
	local player = game.Players.LocalPlayer
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end

	local root = char.HumanoidRootPart
	local nearestMoney
	local shortestDist = math.huge

	-- Find nearest Money MeshPart
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") and v.Name == "Money" then
			local dist = (v.Position - root.Position).Magnitude
			if dist < shortestDist then
				shortestDist = dist
				nearestMoney = v
			end
		end
	end

	-- Teleport if found
	if nearestMoney then
		root.CFrame = CFrame.new(nearestMoney.Position + Vector3.new(0, 3, 0))
	end
end)

main = window:Tab("other")
main:Button("anti lag", function()
	-- Roblox Anti-Lag Optimizer
	-- Place in ServerScriptService


	-- Function to clean up workspace
	local function clearWorkspace()
		for _, obj in pairs(workspace:GetChildren()) do
			-- Remove unanchored loose parts
			if obj:IsA("Part") and not obj.Anchored and not obj.Parent:FindFirstChild("Humanoid") then
				obj:ClearAllChildren()
			end

			-- Limit particle emitters
			if obj:IsA("ParticleEmitter") then
				obj.Lifetime = NumberRange.new(1, 2) -- shorter lifetime
				obj.Rate = math.min(obj.Rate, 20) -- cap emission rate
			end

			-- Limit sounds
			if obj:IsA("Sound") then
				obj.PlaybackSpeed = 1
				obj.Volume = math.min(obj.Volume, 0.5) -- cap volume
			end
		end
	end

	-- Function to clean players’ characters
	local function optimizeCharacters()
		for _, player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				for _, part in pairs(player.Character:GetDescendants()) do
					if part:IsA("ParticleEmitter") then
						part.Rate = math.min(part.Rate, 15)
					elseif part:IsA("Trail") then
						part.Lifetime = 0.5 -- shorten trail lifetime
					end
				end
			end
		end
	end

	-- Run cleanup every 30 seconds
	while true do
		clearWorkspace()
		optimizeCharacters()
		wait(30)
	end

end)
main:Button("esp", function()
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
main:Button("connect network (joke that glitches listerners)", function()
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

end) 
