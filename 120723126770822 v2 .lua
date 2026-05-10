warn("THIS HUB HAS BUGS you can break and cant spawn at another ant team and need to nrejoin")
-- Call this function whenever you want to run it
local mixaUiLIB = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()
lib = mixaUiLIB
local window = lib:CreateWindow("Ants Simple Small World 2 | luma_hub")
local pid = game.PlaceId
function notify(t,msg)
	game.StarterGui:SetCore("SendNotification", {
		Title = t,
		Text = msg,
		Duration = 5
	})
end
if pid ~= 120723126770822 then
	return notify("LumaHub - error", "luma hub has detected a different place id  you need to get into the right game go into Placeid 120723126770822 or search Ants Simple Small World 2")
end
-- OP tab
main = window:Tab("op")
local autoEat = false
local eatThread

local function autoEatLoop()
	while autoEat do
		task.wait(0.1)
		local foodFolder = workspace:FindFirstChild("LiveFood")
		if not foodFolder then break end

		for _, remote in pairs(foodFolder:GetDescendants()) do
			if remote:IsA("RemoteEvent") then
				remote:FireServer()
				remote:FireServer(game.Players.LocalPlayer)
			end
		end
	end
end

main:Button("toggle auto eat", function()
	autoEat = not autoEat
	print(tostring(autoEat))
	if autoEat then
		eatThread = coroutine.create(autoEatLoop)
		coroutine.resume(eatThread)
	else
		autoEat = false
	end
end)
local function foodESP()
	local foodFolder = workspace:FindFirstChild("LiveFood")
	if not foodFolder then return end

	for _, item in pairs(foodFolder:GetDescendants()) do
		if item:IsA("BasePart") then
			-- Check if already has a Highlight
			if not item:FindFirstChild("FoodESP") then
				local highlight = Instance.new("Highlight")
				highlight.Name = "FoodESP"
				highlight.FillColor = Color3.fromRGB(0, 255, 0) -- bright green
				highlight.OutlineColor = Color3.fromRGB(255, 255, 0) -- yellow outline
				highlight.FillTransparency = 0.5
				highlight.OutlineTransparency = 0
				highlight.Parent = item
			end
		end
	end
end

-- Add to your UI
main:Button("food ESP", function()
	foodESP()
end)
main:Button("grab all tools", function()
	local player = game.Players.LocalPlayer
	local bp = player.Backpack
	for i,tool in pairs(bp:GetDescendants()) do
		tool.Parent =player.Character
	end
end)
main:Button("ungrab tools", function()
	local player = game.Players.LocalPlayer
	local bp = player.Backpack
	for i,tool in pairs(player.Character:GetDescendants()) do
		if tool:IsA("Tool") then
			tool.Parent =bp
		end
	end
end)
local function bringFood()
	local lp = game.Players.LocalPlayer
	sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
	local char = lp.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local foodFolder = workspace:FindFirstChild("LiveFood")
	if not foodFolder then return end

	for _, item in pairs(foodFolder:GetDescendants()) do
		if item:IsA("BasePart") and not item.Anchored then
			-- remove old BodyVelocity if exists
			local old = item:FindFirstChild("FoodBringBV")
			if old then old:Destroy() end

			local bv = Instance.new("BodyVelocity")
			bv.Name = "FoodBringBV"
			bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)

			-- direction vector from food to HRP
			local direction = (hrp.Position - item.Position).Unit
			bv.Velocity = direction * 100 -- adjust speed here
			bv.Parent = item
			local debris = game:GetService("Debris")
			debris:AddItem(bv, 1) -- auto-remove after 0.5s
			
		end
	end
end

-- Add to your UI
main:Button("bring food", function()
	bringFood()
end)
main_A = window:Tab("when glitched")
main_A:Button("rejoin", function()
	local TeleportService = game:GetService("TeleportService")
	local player = game.Players.LocalPlayer
	TeleportService:Teleport(game.PlaceId, player)
end)
main_A:Button("anti teleport freeze", function()
	local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		while wait(0.5) do
			hrp.Anchored = false
		end
	end
end)
main_A:Button("anti kick", function()
	while wait(0.5) do
		local lp = game.Players.LocalPlayer.Kick
		
		local oldLp
		oldLp = hookfunction(lp, newcclosure(function(...)
			return print("Attempt To kick has been blocked")
		end))
		
	end
end)
--[[
more tash
]]
main_B = window:Tab("speed")
main_B:Button("fast walk", function()
	local player = game.Players.LocalPlayer
	local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = 26
	end
end)
main_B:Button("slow walk", function()
	local player = game.Players.LocalPlayer
	local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = 6
	end
end)
main_B:Button("normal walk", function()
	local player = game.Players.LocalPlayer
	local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = 16
	end
	
end)
main_B:Button("bypass kick", function()
	local player = game.Players.LocalPlayer
	
	setreadonly(player, false)
	local oldkick = player.Kick
	local err,ok = pcall(function ()
		oldkick = hookfunction(oldkick, newcclosure(function()
			return print("Bypassed kick")
		end))
	end)
	if err then
		oldkick = function ()
			return print("Bypassed kick")
		end
	else
	print("lel i bypassed")
	end
end)
local err,ok = pcall(function ()
	-- 1) anti adonis, remote spy finder, anti hook bypass
	local getthreadidentity = getthreadidentity or syn.get_thread_identity or get_thread_identity or get_thread_identify or getthreadidentify
	local isadonis = false

	for i, v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v, "Detected") and typeof(rawget(v, "Detected")) == "function" then
			isadonis = true
		end
	end

	if isadonis == true then
		local getinfo = getinfo or debug.getinfo
		local DEBUG = false
		local Hooked = {}

		local Detected, Kill

		setthreadidentity(2)

		for i, v in getgc(true) do
			if typeof(v) == "table" then
				local DetectFunc = rawget(v, "Detected")
				local KillFunc = rawget(v, "Kill")

				if typeof(DetectFunc) == "function" and not Detected then
					Detected = DetectFunc

					local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
						if Action ~= "_" then
							if DEBUG then
								warn("Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}")
							end
						end

						return true
					end)

					table.insert(Hooked, Detected)
				end

				if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
					Kill = KillFunc
					local Old; Old = hookfunction(Kill, function(Info)
						if DEBUG then
							warn("Adonis AntiCheat tried to kill (fallback): {Info}")
						end
					end)

					table.insert(Hooked, Kill)
				end
			end
		end

		local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
			local LevelOrFunc, Info = ...

			if Detected and LevelOrFunc == Detected then
				if DEBUG then
					warn("zins | adonis bypassed")
				end

				return coroutine.yield(coroutine.running())
			end

			return Old(...)
		end))

		setthreadidentity(7)
	end

	-- 2) slap battles and other anti cheat
	if game.PlaceId == 6403373529 then
		local Namecall
		Namecall = hookmetamethod(game, '__namecall', function(self, ...)
			if getnamecallmethod() == 'FireServer' and tostring(self) == 'Ban' then
				return
			elseif getnamecallmethod() == 'FireServer' and tostring(self) == 'WalkSpeedChanged' then
				return
			elseif getnamecallmethod() == 'FireServer' and tostring(self) == 'AdminGUI' then
				return
			end
			return Namecall(self, ...)
		end)
	end

	if game.PlaceId == 286090429 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Test2/main/Test2"))()
	end

	if game.PlaceId == 2788229376 then
		local Detectors = {CHECKER_1 = true, TeleportDetect = true, OneMoreTime = true, BANREMOTE = true, KICKREMOTE = true, PERMAIDBAN = true, BreathingHAMON = true}

		local mt = getrawmetatable(game)
		local backupnamecall = mt.__namecall
		setreadonly(mt, false)

		mt.__namecall = newcclosure(function(...)
			local method = getnamecallmethod()
			local args = {...}

			if (method == "FireServer" and tostring(args[1]) == "MainEvent" and Detectors[args[2]]) then
				return wait(math.huge)
			end

			if (not checkcaller() and getfenv(1).crash ~= nil and getfenv(1).checkChild ~= nil) then
				getcallingscript():Destroy()
				return wait(math.huge)
			end

			return backupnamecall(...)
		end)

		setreadonly(mt, true)
	end
end)
if err then
	print("error.")
else
	print("no err")
end
spawn(function ()
	anti = hookmetamethod(game.Players, "__namecall", newcclosure(function(self, ...)
		if not checkcaller() and self == game.Players.LocalPlayer and table.find({"destroy", "kick", "remove"}, getnamecallmethod():lower()) then
			warn("an attempt to destroy a player has been eliminated")
			return nil
		end
		return anti(self, ...)
	end))
end)
