local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "quiet city-luma_hub",
   Icon = 0,
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ShowText = "Rayfield",
   Theme = "Default",
   ToggleUIKeybind = "K",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "quietcityhub"
   }
})

-- OP Tab
local OP = Window:CreateTab("OP", 4483362458)
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
local Teleports = Window:CreateTab("Teleports", 4483362458)

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

-- Other Tab
local Other = Window:CreateTab("Other", 4483362458)

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
