-- LumaHub (final, getgenv integrated, safe) ---------------------------------
warn("THIS HUB HAS BUGS you can break and sometimes you die then cant spawn at another ant team and need to rejoin")

-- Load UI library safely
local lib
do
	local ok, result = pcall(function()
		local code = game:HttpGet("https://api.rubis.app/v2/scrap/3XJlkglDUtKHTGeq/raw")
		return loadstring(code)()
	end)
	if not ok then
		warn("UI library failed to load:", result)
		-- Minimal fallback UI object with same API surface used below
		lib = {}
		function lib:CreateWindow(title)
			return {
				Tab = function(_, name)
					return {
						Button = function(_, btnName, fn)
							print(("Fallback UI: Button created - %s"):format(btnName))
						end,
						Label = function() end
					}
				end
			}
		end
	else
		lib = result
	end
end

local window = lib:CreateWindow("Ants Simple Small World 2 | luma hub")
local pid = game.PlaceId

-- Safe notify wrapper
local function notify(title, msg)
	local ok, err = pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = msg,
			Duration = 5
		})
	end)
	if not ok then
		warn("Notify failed:", err)
	end
end

if pid ~= 120723126770822 then
	notify("LumaHub - error", "Detected different PlaceId. Join PlaceId 120723126770822 (Ants Simple Small World 2).")
	notify("LumaHub - Debug", "Teleporting to correct place in 3 seconds...")
	wait(3)
	local TeleportService = game:GetService("TeleportService")
	local player = game.Players.LocalPlayer
	pcall(function()
		TeleportService:Teleport(120723126770822, player)
	end)
end

-- Use getgenv for persistent globals
local G = (getgenv and getgenv()) or _G

-- Debug logger
G.Luma_DebugLog = G.Luma_DebugLog or {}
local DebugLog = G.Luma_DebugLog
local function logDebug(...)
	local msg = table.concat({...}, " ")
	table.insert(DebugLog, 1, os.date("%X") .. " - " .. msg)
	if #DebugLog > 300 then table.remove(DebugLog) end
	print("[LumaHub DEBUG]", msg)
end

-- OP tab --------------------------------------------------------------------
local main = window:Tab("op")

-- Auto-eat
local autoEat = false
local eatThread

local function autoEatLoop()
	while autoEat do
		task.wait(0.1)
		local foodFolder = workspace:FindFirstChild("LiveFood")
		if not foodFolder then
			logDebug("LiveFood not found; stopping autoEat.")
			break
		end

		for _, remote in pairs(foodFolder:GetDescendants()) do
			if remote:IsA("RemoteEvent") then
				pcall(function()
					remote:FireServer()
					remote:FireServer(game.Players.LocalPlayer)
				end)
			end
		end
	end
end

main:Button("toggle auto eat", function()
	autoEat = not autoEat
	logDebug("AutoEat toggled:", tostring(autoEat))
	if autoEat then
		if not eatThread or coroutine.status(eatThread) == "dead" then
			eatThread = coroutine.create(autoEatLoop)
			coroutine.resume(eatThread)
		end
		notify("AutoEat", "Enabled")
	else
		notify("AutoEat", "Disabled")
	end
end)

-- Food ESP
local function foodESP()
	local foodFolder = workspace:FindFirstChild("LiveFood")
	if not foodFolder then
		notify("Food ESP", "No LiveFood folder found.")
		return
	end

	for _, item in pairs(foodFolder:GetDescendants()) do
		if item:IsA("BasePart") then
			if not item:FindFirstChild("FoodESP") then
				local highlight = Instance.new("Highlight")
				highlight.Name = "FoodESP"
				highlight.FillColor = Color3.fromRGB(0, 255, 0)
				highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
				highlight.FillTransparency = 0.5
				highlight.OutlineTransparency = 0
				highlight.Parent = item
			end
		end
	end
	logDebug("Food ESP applied.")
	notify("Food ESP", "Applied highlights to LiveFood parts.")
end

main:Button("food ESP", function()
	pcall(foodESP)
end)

-- Grab / ungrab tools
main:Button("grab all tools", function()
	local player = game.Players.LocalPlayer
	local bp = player:FindFirstChild("Backpack")
	if not bp then return notify("Grab Tools", "Backpack not found.") end
	for _, tool in pairs(bp:GetDescendants()) do
		if tool:IsA("Tool") then
			pcall(function() tool.Parent = player.Character end)
		end
	end
	logDebug("Grabbed tools to character.")
	notify("Tools", "Grabbed tools to character.")
end)

main:Button("ungrab tools", function()
	local player = game.Players.LocalPlayer
	local bp = player:FindFirstChild("Backpack")
	if not bp then return notify("Ungrab Tools", "Backpack not found.") end
	for _, tool in pairs(player.Character:GetDescendants()) do
		if tool:IsA("Tool") then
			pcall(function() tool.Parent = bp end)
		end
	end
	logDebug("Returned tools to backpack.")
	notify("Tools", "Returned tools to backpack.")
end)

-- Bring food (physics-based)
local function bringFood()
	local lp = game.Players.LocalPlayer
	local char = lp.Character
	if not char then return notify("Bring Food", "Character not found.") end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return notify("Bring Food", "HumanoidRootPart not found.") end

	local foodFolder = workspace:FindFirstChild("LiveFood")
	if not foodFolder then return notify("Bring Food", "No LiveFood folder found.") end

	for _, item in pairs(foodFolder:GetDescendants()) do
		if item:IsA("BasePart") and not item.Anchored then
			local old = item:FindFirstChild("FoodBringBV")
			if old then old:Destroy() end

			local bv = Instance.new("BodyVelocity")
			bv.Name = "FoodBringBV"
			bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
			local success, dir = pcall(function()
				return (hrp.Position - item.Position).Unit
			end)
			if success and dir then
				bv.Velocity = dir * 100
			else
				bv.Velocity = Vector3.new(0, 0, 0)
			end
			bv.Parent = item
			game:GetService("Debris"):AddItem(bv, 1)
		end
	end
	logDebug("bringFood executed.")
	notify("Bring Food", "Attempted to bring nearby food.")
end

main:Button("bring food", function()
	pcall(bringFood)
end)

-- When glitched tab ---------------------------------------------------------
local main_A = window:Tab("when glitched")

main_A:Button("rejoin", function()
	local TeleportService = game:GetService("TeleportService")
	local player = game.Players.LocalPlayer
	pcall(function()
		TeleportService:Teleport(game.PlaceId, player)
	end)
	logDebug("Rejoin requested.")
	notify("Rejoin", "Teleport requested.")
end)

main_A:Button("anti teleport freeze", function()
	spawn(function()
		local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return notify("Anti Freeze", "HumanoidRootPart not found.") end
		local t0 = tick()
		while tick() - t0 < 10 do
			hrp.Anchored = false
			task.wait(0.5)
		end
		logDebug("Anti teleport freeze ran for 10s.")
		notify("Anti Freeze", "Ran for 10 seconds.")
	end)
end)

-- Safe demonstration hooks using getgenv
main_A:Button("safe hook hub (toggle print)", function()
	if not G.__luma_original_print then
		G.__luma_original_print = print
		print = function(...)
			G.__luma_original_print("[HOOKED PRINT]", ...)
		end
		notify("Hook Hub", "print() hooked. Press again to restore.")
		logDebug("print hooked via getgenv.")
	else
		print = G.__luma_original_print
		G.__luma_original_print = nil
		notify("Hook Hub", "print() restored.")
		logDebug("print restored via getgenv.")
	end
end)

main_A:Button("safe hook hub (toggle math.random)", function()
	if not G.__luma_original_random then
		G.__luma_original_random = math.random
		math.random = function(...)
			local r = G.__luma_original_random(...)
			print("[HOOKED RANDOM] ->", r)
			return r
		end
		notify("Hook Hub", "math.random hooked. Press again to restore.")
		logDebug("math.random hooked via getgenv.")
	else
		math.random = G.__luma_original_random
		G.__luma_original_random = nil
		notify("Hook Hub", "math.random restored.")
		logDebug("math.random restored via getgenv.")
	end
end)

-- Speed tab -----------------------------------------------------------------
local main_B = window:Tab("speed")

local function setWalkSpeed(speed)
	local player = game.Players.LocalPlayer
	local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = speed
		logDebug("WalkSpeed set to", speed)
		notify("WalkSpeed", "Set to " .. tostring(speed))
	else
		notify("WalkSpeed", "Humanoid not found.")
	end
end

main_B:Button("fast walk", function() setWalkSpeed(26) end)
main_B:Button("slow walk", function() setWalkSpeed(6) end)
main_B:Button("normal walk", function() setWalkSpeed(16) end)

-- Bypass kick intentionally disabled for safety
main_B:Button("bypass kick (disabled)", function()
	notify("Disabled", "Bypass kick functionality is intentionally disabled.")
	logDebug("User attempted bypass kick; blocked.")
end)

-- Environment checks (safe)
pcall(function()
	if getgc then
		for _, v in next, getgc(true) do
			if typeof(v) == "table" and rawget(v, "Detected") and typeof(rawget(v, "Detected")) == "function" then
				logDebug("Adonis-like anti-cheat detected in environment.")
				notify("Debug", "Adonis-like anti-cheat detected in environment.")
				break
			end
		end
	end
end)
function openconsole()
	local startergui = game:GetService("StarterGui")
	startergui:SetCore("DevConsoleVisible", true)
end
-- Debug tab -----------------------------------------------------------------
local debugTab = window:Tab("debug")
debugTab:Label("debugs")
debugTab:Button("Show last 10 logs (console)", function()
	for i = 1, math.min(10, #DebugLog) do
		print(DebugLog[i])
		openconsole()
	end
end)

debugTab:Button("Clear logs", function()
	DebugLog = {}
	notify("Debug", "Logs cleared.")
	logDebug("Logs cleared by user.")
end)

debugTab:Button("Show player info", function()
	local player = game.Players.LocalPlayer
	local char = player.Character
	if char then
		local humanoid = char:FindFirstChild("Humanoid")
		local hrp = char:FindFirstChild("HumanoidRootPart")
		logDebug("Player Info:",
			"WalkSpeed=" .. tostring(humanoid and humanoid.WalkSpeed),
			"Health=" .. tostring(humanoid and humanoid.Health),
			"Position=" .. tostring(hrp and hrp.Position)
		)
	else
		notify("Debug", "Character not found.")
	end
end)

-- Finalize
logDebug("LumaHub initialized (getgenv).")
notify("LumaHub", "Initialized. Some exploit features removed because they broke the hub and gave me line 1 errors.")
