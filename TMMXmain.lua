local mixaUiLIB = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()-- creating the library
lib = mixaUiLIB
local window = lib:CreateWindow("TMMX-luma_hub") -- use this to create a window
char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
function addplatform()
	local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local platform = Instance.new("Part")
	platform.Size = Vector3.new(10, 1, 10)
	platform.Position = char.HumanoidRootPart.Position - Vector3.new(0, 2, 0)
	platform.Anchored = true
	platform.CanCollide = true
	platform.Parent = workspace
	spawn(function()
		while wait() do
			platform.Position = char.HumanoidRootPart.Position - Vector3.new(0, 2, 0)
		end
	end)
end
local main = window:Tab("auto farm+more")
function autpfarmv3()
	local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")
	local hrp = char.PrimaryPart
	local function tinyStep()
		hum:Move(Vector3.new(0,0,0.1), true)
	end
	dc=workspace.DebrisClient
	local Classnamne = "Model"
	dc.ChildAdded:Connect(function (ch)
		if ch:IsA(Classnamne) then
			local lp = game.Players.LocalPlayer
			local char = lp.Character
			local hrp = char.HumanoidRootPart
			hrp.CFrame = CFrame.new(0,0,0)
			hrp.Anchored = true
			ch:MoveTo(Vector3.new(0,0,0))
			wait(0.1)
			for i,v in pairs(ch:GetChildren()) do
				if v:IsA("BasePart") then
					hrp.CFrame = v.CFrame
					v.CFrame = hrp.CFrame
					workspace.Gravity = 0
				end
			end

		end
	end)
end
main:Button("auto farm", function()
	local function tinyStep()
		player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local hum = char:WaitForChild("Humanoid")
		hum:Move(Vector3.new(0,0,0.1), true)
	end
	dc=workspace.DebrisClient
	local Classnamne = "Model"
	dc.ChildAdded:Connect(function (ch)
		if ch:IsA(Classnamne) then
			local lp = game.Players.LocalPlayer
			local char = lp.Character
			local hrp = char.HumanoidRootPart
			hrp.CFrame = CFrame.new(0,0,0)
			wait(0.1)
			for i,v in pairs(ch:GetChildren()) do
				if v:IsA("BasePart") then
					hrp.CFrame = v.CFrame
					wait(0.1)
					hrp.CFrame = CFrame.new(0,0,0)
					ch:MoveTo(Vector3.new(0,0,0))
					local hum = char:FindFirstChild("Humanoid")
					if hum then
						task.wait(0.5)
						hum.Health = 0.01
						task.wait(1)
						hrp.CFrame = v.CFrame
						hum.Health = 0.01
						task.wait(1)
						hum.Health = 0.01
						wait()
						hum.Health = 0.01
						hrp.CFrame = v.CFrame
						wait()
						hum.Health = 0.01
						wait()
						hum.Health = 0.01
						wait()
						hrp.Anchored = true
						tinyStep()
						wait(0.1)
						hrp.Anchored = false
						hrp.CFrame = v.CFrame
						hum.Health = 0.01
						wait()
						hum.Health = 0.01
						hum:ChangeState(Enum.HumanoidStateType.FallingDown)
						tinyStep()
						workspace.Gravity = 0
						hrp.RotVelocity = Vector3.new(0,0,50)
					end
				end
			end
		end
	end)
	local min = workspace.Mineables
	min.ChildAdded:Connect(function (ch)
		if ch:IsA(Classnamne) then
			local lp = game.Players.LocalPlayer
			local char = lp.Character
			local hrp = char.PrimaryPart
			hrp.CFrame = CFrame.new(0,0,0)
			wait(0.1)
			for i,v in pairs(ch:GetChildren()) do
				if v:IsA("BasePart") then
					hrp.CFrame = v.CFrame
					wait(0.1)
					v.CFrame = CFrame.new(0,0,0)
					hrp.CFrame = CFrame.new(0,0,0)
					hrp.RotVelocity = Vector3.new(0,0,500)

				end
			end

		end
	end)
end)
function minFarm()
	local min = workspace.Mineables
	min.ChildAdded:Connect(function (ch)
		Classnamne = "Model"
		if ch:IsA(Classnamne) then
			local lp = game.Players.LocalPlayer
			local char = lp.Character
			local hrp = char.PrimaryPart
			hrp.CFrame = CFrame.new(0,0,0)
			wait(0.1)
			for i,v in pairs(ch:GetChildren()) do
				if v:IsA("BasePart") then
					hrp.CFrame = v.CFrame
					wait(0.1)
					v.CFrame = CFrame.new(0,0,0)
					hrp.CFrame = CFrame.new(0,0,0)
					hrp.RotVelocity = Vector3.new(0,0,500)

				end
			end

		end
	end)
end
function tweenautofarm()
	local PathfindingService = game:GetService("PathfindingService");
	local RunService = game:GetService("RunService");
	local Workspace = game:GetService("Workspace");
	local Players = game:GetService("Players");
	local Player = Players.LocalPlayer;

	local Characters = Workspace.Characters;
	local DebrisClient = Workspace.DebrisClient;
	local Mineables = Workspace.Mineables;
	local Entities = Workspace.Entities;

	local RaycastParameters = RaycastParams.new();

	RaycastParameters.FilterType = Enum.RaycastFilterType.Whitelist;
	RaycastParameters.FilterDescendantsInstances = {Entities};
	RaycastParameters.RespectCanCollide = true;

	local TeleportSpeed = 11.5;
	local NextFrame = RunService.Heartbeat;

	local function ImprovedTeleport(Target)
		if (typeof(Target) == "Instance" and Target:IsA("BasePart")) then Target = Target.Position; end;
		if (typeof(Target) == "CFrame") then Target = Target.p end;

		local HRP = (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"));
		if (not HRP) then return; end;

		local StartingPosition = HRP.Position;
		local PositionDelta = (Target - StartingPosition);--Calculating the difference between the start and end positions.
		local StartTime = tick();
		local TotalDuration = (StartingPosition - Target).magnitude / TeleportSpeed;

		repeat NextFrame:Wait();
			local Delta = tick() - StartTime;
			local Progress = math.min(Delta / TotalDuration, 1);--Getting the percentage of completion of the teleport (between 0-1, not 0-100)
			--We also use math.min in order to maximize it at 1, in case the player gets an FPS drop, so it doesn't go past the target.
			local MappedPosition = StartingPosition + (PositionDelta * Progress);
			HRP.Velocity = Vector3.new();--Resetting the effect of gravity so it doesn't get too much and drag the player below the ground.
			HRP.CFrame = CFrame.new(MappedPosition);
			if (HRP.Anchored) then return; end;
		until (HRP.Position - Target).magnitude <= TeleportSpeed / 20;
		HRP.Anchored = false;
		HRP.CFrame = CFrame.new(Target);
	end;

	local function CanGoTo(Target)
		local Path = PathfindingService:CreatePath({
			AgentCanClimb = true;
			AgentCanJump = true;
			AgentJumpHeight = 3;
			WaypointSpacing = 1;
		});
		local HumanoidRootPart = Player.Character.HumanoidRootPart
		Path:ComputeAsync(HumanoidRootPart.Position, Target);
		local _, Points = pcall(Path.GetWaypoints, Path, HumanoidRootPart.Position);
		return (_ and #Points > 0 and Points);
	end;

	local function GetGifts()
		local Gifts = DebrisClient:GetChildren();
		local Mdx = #Gifts;
		for _ = 1, Mdx do
			local Gift = Gifts[_];
			if (not Gift) then break; end;
			if (Gift.Name ~= "GiftPrefab" or not Gift:FindFirstChild("Top") or not Gift:FindFirstChild("HitDetect") or not CanGoTo(Gift.HitDetect.Position)) then
				table.remove(Gifts, _);
				_ = _ - 1;
				Mdx = Mdx - 1;
			end;
		end;
		return Gifts;
	end;

	local function GetGiftDistance(Gift)
		if (not Gift) then return math.huge; end;
		local HitDetect = Gift:FindFirstChild("HitDetect");
		if (not HitDetect) then return math.huge; end;
		return (Player.Character.HumanoidRootPart.Position - HitDetect.Position).Magnitude;
	end;

	local function GetNearestGift()
		local Mineable = Mineables:GetChildren()[1];
		if (Mineable and Mineable:FindFirstChild("Highlight") and CanGoTo(Mineable.Highlight.Position)) then
			return Mineable;
		end;
		local Gifts = GetGifts();
		local ClosestGift = Gifts[1];
		local ClosestDist = GetGiftDistance(ClosestGift);

		for _ = 2, #Gifts do
			local Gift = Gifts[_];
			local Dist = GetGiftDistance(Gift);
			if (Dist < ClosestDist and Dist > 4) then
				ClosestDist = Dist;
				ClosestGift = Gift;
			end;
		end;

		return ((ClosestDist ~= math.huge) and ClosestGift);
	end;

	local function Goto(Target, Gift)
		local Path = PathfindingService:CreatePath({
			AgentCanClimb = true;
			WaypointSpacing = 1;
		});
		local HumanoidRootPart = char.PrimaryPart
		Path:ComputeAsync(HumanoidRootPart.Position, Target);
		local Points = Path:GetWaypoints(HumanoidRootPart.Position);

		for _ = 1, #Points do
			if (not Points[_ + 1]) then break; end;
			local New = Points[_].Position;
			local Next = Points[_ + 1].Position;
			if ((HumanoidRootPart.Position - New).Magnitude > 10) then warn("AX") return; end;-- AC Caught on, so abort.
			ImprovedTeleport(Vector3.new(New.X, math.max(Next.Y, New.Y) + 3, New.Z));
		end;

		if (#Points == 0) then return false; end;
		ImprovedTeleport(Points[#Points].Position + Vector3.new(0, 3, 0));
	end;

	local function FarmGift()
		local Gift = GetNearestGift();
		if (not Gift) then print("No gift") return; end;
		local HitDetect = Gift:FindFirstChild("HitDetect") or Gift:FindFirstChild("Highlight");
		if (not HitDetect or not HitDetect:IsA("BasePart")) then return; end;
		print(Gift);
		if (Goto(HitDetect.Position, Gift) and Gift.Name ~= "GiftPrefab") then
			wait(3);
		end;
	end;

	_G.TMMXFarm = true;
	while (_G.TMMXFarm) do
		RunService.Heartbeat:Wait();
		print(pcall(FarmGift));
	end;
end

main:Button("auto farm v2", function()
	tweenautofarm()
end)
main:Button("auto farm v0", function()
	autpfarmv3()
end)
main:Button("auto farm (mineables)", function()
	minFarm()
end)
main:Button("freeze", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.Sit = false
	hum.PlatformStand = true
	local KEYS ={"W","A","S","D"}
	local w = false
	local a = false
	local s = false
	local d = false
	getgenv().a=a
	getgenv().d=d
	getgenv().w=w
	getgenv().s=s
	local uis = game:GetService("UserInputService")
	local gryos=Instance.new("BodyGyro")
	gryos.CFrame=char.HumanoidRootPart.CFrame
	gryos.Parent=char.HumanoidRootPart
	local spd=Instance.new("BodyVelocity")
	spd.velocity=Vector3.new(0,2,0)
	spd.parent=char.HumanoidRootPart
	local fsg=Instance.new("BodyVelocity")
	fsg.velocity=Vector3.new(0,5,0)
	fsg.parent=char.Head
	spawn(function ()
		task.wait(4)
		spd:Destroy()
		fsg:Destroy()
	end)
	GGNS={
		getgenv().a,
		getgenv().d,
		getgenv().s,
		getgenv().w,
	}
	if w == true and s == true and d == true and a == true or GGNS.a == true and GGNS.d == true and GGNS.s == true and GGNS.w == true then
		print("stopped")
		a = false
		d = false
		s = false
		w = false
		gryos:Destroy()
	end
	uis.InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.W then
			if char.HumanoidRootPart:FindFirstChild("W") then
				char.HumanoidRootPart.W:Destroy()
			end
			w = true
			local char = game.Players.LocalPlayer.Character
			local bodyvel=Instance.new("BodyVelocity")
			bodyvel.Name ="W"
			bodyvel.MaxForce=Vector3.new(9999,5000,999999)
			bodyvel.Velocity =Vector3.new(0,0,100)
			bodyvel.Parent=char.HumanoidRootPart
			local float=Instance.new("BodyForce")
			float.force=Vector3.new(0,10000,0)
			float.Parent=char.HumanoidRootPart

		end
		if key.KeyCode == Enum.KeyCode.A then
			if char.HumanoidRootPart:FindFirstChild("A") then
				char.HumanoidRootPart.A:Destroy()
			end
			a = true
			local char = game.Players.LocalPlayer.Character
			local bodyvel=Instance.new("BodyVelocity")
			bodyvel.Name ="A"
			bodyvel.MaxForce=Vector3.new(9999,5000,999999)
			bodyvel.Velocity =Vector3.new(-100,0,0)
			bodyvel.Parent=char.HumanoidRootPart
		end
		if key.KeyCode == Enum.KeyCode.S then
			if char.HumanoidRootPart:FindFirstChild("S") then
				char.HumanoidRootPart.S:Destroy()
			end
			s = true
			local char = game.Players.LocalPlayer.Character
			local bodyvel=Instance.new("BodyVelocity")
			bodyvel.Name ="S"
			bodyvel.MaxForce=Vector3.new(9999,5000,999999)
			bodyvel.Velocity =Vector3.new(0,0,-100)
			bodyvel.Parent=char.HumanoidRootPart
		end
		if key.KeyCode == Enum.KeyCode.D then
			if char.HumanoidRootPart:FindFirstChild("D") then
				char.HumanoidRootPart.D:Destroy()
			end
			d = true
			local char = game.Players.LocalPlayer.Character
			local bodyvel=Instance.new("BodyVelocity")
			bodyvel.Name ="D"
			bodyvel.MaxForce=Vector3.new(9999,5000,999999)
			bodyvel.Velocity =Vector3.new(100,0,0)
			bodyvel.Parent=char.HumanoidRootPart
		end
	end)
	wait(0.5)
	local char = game.Players.LocalPlayer.Character
	char.HumanoidRootPart.Anchored = true
	local Humanoid = char:WaitForChild("Humanoid")
	Humanoid.Health = 0
end)
main:Button("loop delete dead players", function()
	while wait(2) do
		for i, v in pairs(game.Players:GetPlayers()) do
			if v.Humanoid.Health == 0 and v ~= game.Players.LocalPlayer then
				v.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0,0,0)
			end
		end
	end
end)
local ALR = false
workspace.ChildAdded:Connect(function (chi)
	if ALR == true then
		return
	end
	if chi.Name == "Entities" then
		main:Button("auto farm (Entities)", function()
			gp()
		end)
		ALR = true
	end
end)

local main = window:Tab("more")
local connection
main:Button("noclip", function()
	connection = game:GetService("RunService").RenderStepped:Connect(function()
		local char = game.Players.LocalPlayer.Character
		for _, v in pairs(char:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end)
	return connection
end)
main:Button("clip", function()
	connection:Disconnect()
end)
main:Button("goto all palyers", function()
	for i, v in pairs(game.Players:GetPlayers()) do
		local lp=game.Players.LocalPlayer.Character
		lp.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
	end
end)
main:Button("platform", function()
	addplatform()
end)
main:Button("aimbot", function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
	loadstring(game:HttpGet("https://raw.githubusercontent.com/GZSSF/Aimbotv2/refs/heads/main/AimbotV2"))()
end)
main:Button("cat all", function()
	local id = "rbxassetid://113201350610238"
	local texture = "rbxassetid://97640292894787"
	while wait(1) do
		for i, v in pairs(workspace:GetDescendants()) do
			if v:IsA("Model") then
				for i, v2 in pairs(v:GetDescendants()) do
					if v:IsA("Tool") then
						for i, v3 in pairs(v2:GetDescendants()) do
							if v3:IsA("BasePart") then
								v3.Transparency = 0
								local highlight=Instance.new("Highlight",v)
								highlight.Adornee=v
								highlight.FillColor = Color3.new(0, 0.666667, 1)

							end
						end
					end
				end
				if v:FindFirstChild("Humanoid") then
					for i, v2 in pairs(v:GetDescendants()) do
						if v2:IsA("BasePart") and v2.name ~= "HumanoidRootPart" then
							v2.Transparency = 1
							local hrp = v:FindFirstChild("HumanoidRootPart")
							if hrp and not hrp:FindFirstChild("Meshs_Cat") then
								hrp.Transparency = 0
								local Mesh=Instance.new("SpecialMesh",hrp)
								Mesh.Name = "Meshs_Cat"--Meshs_Cat
								Mesh.MeshId = id
								Mesh.TextureId = texture
								Mesh.Scale = Vector3.new(1.2,1.2,1.2)
								local highlight=Instance.new("Highlight",v)
								highlight.Adornee=v
								if v2:FindFirstChild"Head" then
									if v2.Head:FindFirstChild("Face") then
										v2.Head:FindFirstChild("Face"):Destroy()
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)
local main = window:Tab("other")
main:Button("sit", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.Sit = true
end)

main:Button("fly", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.Sit = false
	hum.PlatformStand = true
	local KEYS ={"W","A","S","D"}
	local w = false
	local a = false
	local s = false
	local d = false
	getgenv().a=a
	getgenv().d=d
	getgenv().w=w
	getgenv().s=s
	local uis = game:GetService("UserInputService")
	local gryos=Instance.new("BodyGyro")
	gryos.CFrame=char.HumanoidRootPart.CFrame
	gryos.Parent=char.HumanoidRootPart
	local spd=Instance.new("BodyVelocity")
	spd.velocity=Vector3.new(0,2,0)
	spd.parent=char.HumanoidRootPart
	local fsg=Instance.new("BodyVelocity")
	fsg.velocity=Vector3.new(0,5,0)
	fsg.parent=char.Head
	spawn(function ()
		task.wait(4)
		spd:Destroy()
		fsg:Destroy()
	end)
	GGNS={
		getgenv().a,
		getgenv().d,
		getgenv().s,
		getgenv().w,
	}
	Funcs={
		ANTI_AFK = function()
			spawn(function ()
				while wait(0.1) do
					local char = game.Players.LocalPlayer.Character
					local hum = char:FindFirstChildOfClass("Humanoid")
					hum.Sit = false
					hum.Name="!"
					hum:move(Vector3.new(0,0,0.1))
					wait(0.1)
					hum:move(Vector3.new(0,0,-0.1))
				end
			end)
		end,
		invis = function()
			chlo=char:Clone()
			chlo.Parent=workspace
			char:MoveTo(Vector3.new(0,1076527345,0))
			char.Parent = game.Lighting
			local Lone=Instance.new("RotateV",workspace)
			Lone.Name = "Lone"
			Lone.CFrame=char.HumanoidRootPart.CFrame
			Lone.Parent=cha
			char.UpperTorso.name = "SketchyKid=_-65$*¨&!@#2!18567485y73e4rgftueyrt3[[]]'sketchba'"..[["haha nah"]]..tostring(math.random(999999999999999999999999999,999999999999999999),math.random(999999999999999999999999999,999999999999999999))
			char = chlo
			chlo.Name = "TaskPrefab"
			for _, v in pairs(chlo:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0.5
				end
			end
		end,
	}
	Funcs.ANTI_AFK()
	if w == true and s == true and d == true and a == true or GGNS.a == true and GGNS.d == true and GGNS.s == true and GGNS.w == true then
		print("stopped")
		a = false
		d = false
		s = false
		w = false
		gryos:Destroy()
	end
	uis.InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.W then
			if char.HumanoidRootPart:FindFirstChild("W") then
				char.HumanoidRootPart.W:Destroy()
			end
			w = true
			local char = game.Players.LocalPlayer.Character
			local bodyvel=Instance.new("BodyVelocity")
			bodyvel.Name ="W"
			bodyvel.MaxForce=Vector3.new(9999,5000,999999)
			bodyvel.Velocity =Vector3.new(0,0,100)
			bodyvel.Parent=char.HumanoidRootPart
			local float=Instance.new("BodyForce")
			float.force=Vector3.new(0,10000,0)
			float.Parent=char.HumanoidRootPart

		end
		if key.KeyCode == Enum.KeyCode.A then
			if char.HumanoidRootPart:FindFirstChild("A") then
				char.HumanoidRootPart.A:Destroy()
			end
			a = true
			local char = game.Players.LocalPlayer.Character
			local bodyvel=Instance.new("BodyVelocity")
			bodyvel.Name ="A"
			bodyvel.MaxForce=Vector3.new(9999,5000,999999)
			bodyvel.Velocity =Vector3.new(-100,0,0)
			bodyvel.Parent=char.HumanoidRootPart
		end
		if key.KeyCode == Enum.KeyCode.S then
			if char.HumanoidRootPart:FindFirstChild("S") then
				char.HumanoidRootPart.S:Destroy()
			end
			s = true
			local char = game.Players.LocalPlayer.Character
			local bodyvel=Instance.new("BodyVelocity")
			bodyvel.Name ="S"
			bodyvel.MaxForce=Vector3.new(9999,5000,999999)
			bodyvel.Velocity =Vector3.new(0,0,-100)
			bodyvel.Parent=char.HumanoidRootPart
		end
		if key.KeyCode == Enum.KeyCode.D then
			if char.HumanoidRootPart:FindFirstChild("D") then
				char.HumanoidRootPart.D:Destroy()
			end
			d = true
			local char = game.Players.LocalPlayer.Character
			local bodyvel=Instance.new("BodyVelocity")
			bodyvel.Name ="D"
			bodyvel.MaxForce=Vector3.new(9999,5000,999999)
			bodyvel.Velocity =Vector3.new(100,0,0)
			bodyvel.Parent=char.HumanoidRootPart
		end
	end)
end)

function gp()
	p=workspace.Entities
	if p then
		p.ChildAdded:Connect(function(ch)
			if ch:IsA("Model") then
				for i,v in pairs(ch:GetChildren()) do
					if v:IsA("BasePart") then
						local pa = v
						local lp=game.Players.LocalPlayer
						local char = lp.Character
						local hrp=char:FindFirstChild("HumanoidRootPart")
						hrp.CFrame=pa.CFrame
						hrp.Anchored=true
						wait(0.1)
						hrp.CFrame=CFrame.new(0,0,0)
						wait(0.1)
						hrp.Anchored=false
						hrp.CFrame=pa.CFrame
					end
				end
			end
		end)
	end
end
main:Button("esp", function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
	loadstring(game:HttpGet("https://raw.githubusercontent.com/z4tt483/ItzXery.lua/main/Esp-Players.lua"))()
end)
main:Button("invisible", function()
	Funcs.invis()
end)
main:Button("delete humanoid", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum:Destroy()
end)
main:Button("random theme", function()
	lib:SetTheme({
		Background = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255)),
		Topbar = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255)),
		TabBar = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255)),
		Button = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255)),
		Accent = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255)),
		TextColor = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
	})
end)

local main = window:Tab("hipheight")

main:Button("0 hipheight", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.HipHeight = 0
end)
main:Button("5 hipheight", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.HipHeight = 5
end)--🏚
main:Button("10 hipheight", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.HipHeight = 10
end)
main:Button("15 hipheight", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.HipHeight = 15
end)
main:Button("20 hipheight", function()
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	hum.HipHeight = 20
end)

main:Button("if you are in sharp click here", function()
	local X = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()-- creating the library
	local Window = X:CreateWindow("Second script stock luma_ui")

	local main = Window:Tab("sharp scripts")
	main:Button("server hop", function()
	--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		local File = pcall(function()
			AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
		end)
		if not File then
			table.insert(AllIDs, actualHour)
			writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
		end
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end

		function Teleport()
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end

		-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
		Teleport()
	end)
	main:Button("aimbot", function()
		loadstring(game:HttpGet("https://pastefy.app/Zqb5y63Z/raw"))()
	end)
	local main = Window:Tab("other")
	main:Button("Dex", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
	end)
	main:Button("Fling", function()
		do
			local l__Players__1 = game:GetService("Players");
			local l__RunService__2 = game:GetService("RunService");
			local l__LocalPlayer__3 = l__Players__1.LocalPlayer;
			local l__HrP__4 = l__LocalPlayer__3.Character.HumanoidRootPart;
			local add = Instance.new
			local v1=add("BodyThrust",l__HrP__4)
			local v2 = function()
				while l__RunService__2.RenderStepped:Wait() do
					v1.Parent = l__HrP__4
				end

			end
			spawn(v2)
			local v3 = function()
				v1.Force=Vector3.new(98999999, 10000, 999999999999999999999999999999999999999)
				l__HrP__4.AssemblyLinearVelocity = Vector3.new(0, 0, 888888888888888888888888888888888888888888)

			end
			v3()
			local v4 = function()
				l__HrP__4.Anchored = true
				l__HrP__4:BreakJoints()
			end
			v4()
		end
	end)
	main:Button("delete effects/ coins", function()
		do
			local l__DebrisClient__1 = workspace.DebrisClient;
			local ClassName = "Model"
			l__DebrisClient__1.ChildAdded:Connect(function(v)
				if v:IsA(ClassName) then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("BasePart") then
							v.CFrame = CFrame.new(0,0,0)
							v.Anchored = true
						end
					end
				end
			end)
		end
	end)
	main:Button("bring effects", function()
		do
			local l__DebrisClient__1 = workspace.DebrisClient;
			local ClassName = "Model"
			l__DebrisClient__1.ChildAdded:Connect(function(v)
				if v:IsA(ClassName) then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("BasePart") then
							v.CFrame =game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
							v.Anchored = true
						end
					end
				end

			end)
		end
	end)
	main:Button("bring mineables", function()
		do
			local l__Min__1 = workspace.Mineables
			local ClassName = "Model"
			l__Min__1.ChildAdded:Connect(function(v)
				if v:IsA(ClassName) then
					for i,v in pairs(v:GetChildren()) do
						if v:IsA("BasePart") then
							v.CFrame =game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
							v.Anchored = true
						end
					end
				end
			end)
		end
	end)
	local main = Window:Tab("auto farm")
	main:Button("auto farm (can go into traps i think)", function()
		local PathfindingService = game:GetService("PathfindingService");
		local RunService = game:GetService("RunService");
		local Workspace = game:GetService("Workspace");
		local Players = game:GetService("Players");
		local Player = Players.LocalPlayer;

		local Characters = Workspace.Characters;
		local DebrisClient = Workspace.DebrisClient;
		local Mineables = Workspace.Mineables;
		local Entities = Workspace.Entities;

		local RaycastParameters = RaycastParams.new();

		RaycastParameters.FilterType = Enum.RaycastFilterType.Whitelist;
		RaycastParameters.FilterDescendantsInstances = {Entities};
		RaycastParameters.RespectCanCollide = true;

		local TeleportSpeed = 11.5;
		local NextFrame = RunService.Heartbeat;

		local function ImprovedTeleport(Target)
			if (typeof(Target) == "Instance" and Target:IsA("BasePart")) then Target = Target.Position; end;
			if (typeof(Target) == "CFrame") then Target = Target.p end;

			local HRP = (Player.Character and Player.Character:FindFirstChild("HumanoidRootPart"));
			if (not HRP) then return; end;

			local StartingPosition = HRP.Position;
			local PositionDelta = (Target - StartingPosition);--Calculating the difference between the start and end positions.
			local StartTime = tick();
			local TotalDuration = (StartingPosition - Target).magnitude / TeleportSpeed;

			repeat NextFrame:Wait();
				local Delta = tick() - StartTime;
				local Progress = math.min(Delta / TotalDuration, 1);--Getting the percentage of completion of the teleport (between 0-1, not 0-100)
				--We also use math.min in order to maximize it at 1, in case the player gets an FPS drop, so it doesn't go past the target.
				local MappedPosition = StartingPosition + (PositionDelta * Progress);
				HRP.Velocity = Vector3.new();--Resetting the effect of gravity so it doesn't get too much and drag the player below the ground.
				HRP.CFrame = CFrame.new(MappedPosition);
				if (HRP.Anchored) then return; end;
			until (HRP.Position - Target).magnitude <= TeleportSpeed / 20;
			HRP.Anchored = false;
			HRP.CFrame = CFrame.new(Target);
		end;

		local function CanGoTo(Target)
			local Path = PathfindingService:CreatePath({
				AgentCanClimb = true;
				AgentCanJump = true;
				AgentJumpHeight = 3;
				WaypointSpacing = 1;
			});
			local HumanoidRootPart = Player.Character.HumanoidRootPart
			Path:ComputeAsync(HumanoidRootPart.Position, Target);
			local _, Points = pcall(Path.GetWaypoints, Path, HumanoidRootPart.Position);
			return (_ and #Points > 0 and Points);
		end;

		local function GetGifts()
			local Gifts = DebrisClient:GetChildren();
			local Mdx = #Gifts;
			for _ = 1, Mdx do
				local Gift = Gifts[_];
				if (not Gift) then break; end;
				if (Gift.Name ~= "GiftPrefab" or not Gift:FindFirstChild("Top") or not Gift:FindFirstChild("HitDetect") or not CanGoTo(Gift.HitDetect.Position)) then
					table.remove(Gifts, _);
					_ = _ - 1;
					Mdx = Mdx - 1;
				end;
			end;
			return Gifts;
		end;

		local function GetGiftDistance(Gift)
			if (not Gift) then return math.huge; end;
			local HitDetect = Gift:FindFirstChild("HitDetect");
			if (not HitDetect) then return math.huge; end;
			return (Player.Character.HumanoidRootPart.Position - HitDetect.Position).Magnitude;
		end;

		local function GetNearestGift()
			local Mineable = Mineables:GetChildren()[1];
			if (Mineable and Mineable:FindFirstChild("Highlight") and CanGoTo(Mineable.Highlight.Position)) then
				return Mineable;
			end;
			local Gifts = GetGifts();
			local ClosestGift = Gifts[1];
			local ClosestDist = GetGiftDistance(ClosestGift);

			for _ = 2, #Gifts do
				local Gift = Gifts[_];
				local Dist = GetGiftDistance(Gift);
				if (Dist < ClosestDist and Dist > 4) then
					ClosestDist = Dist;
					ClosestGift = Gift;
				end;
			end;

			return ((ClosestDist ~= math.huge) and ClosestGift);
		end;

		local function Goto(Target, Gift)
			local Path = PathfindingService:CreatePath({
				AgentCanClimb = true;
				WaypointSpacing = 1;
			});
			local HumanoidRootPart = Player.Character.HumanoidRootPart
			Path:ComputeAsync(HumanoidRootPart.Position, Target);
			local Points = Path:GetWaypoints(HumanoidRootPart.Position);

			for _ = 1, #Points do
				if (not Points[_ + 1]) then break; end;
				local New = Points[_].Position;
				local Next = Points[_ + 1].Position;
				if ((HumanoidRootPart.Position - New).Magnitude > 10) then warn("AX") return; end;-- AC Caught on, so abort.
				ImprovedTeleport(Vector3.new(New.X, math.max(Next.Y, New.Y) + 3, New.Z));
			end;

			if (#Points == 0) then return false; end;
			ImprovedTeleport(Points[#Points].Position + Vector3.new(0, 3, 0));
		end;

		local function FarmGift()
			local Gift = GetNearestGift();
			if (not Gift) then print("No gift") return; end;
			local HitDetect = Gift:FindFirstChild("HitDetect") or Gift:FindFirstChild("Highlight");
			if (not HitDetect or not HitDetect:IsA("BasePart")) then return; end;
			print(Gift);
			if (Goto(HitDetect.Position, Gift) and Gift.Name ~= "GiftPrefab") then
				wait(3);
			end;
		end;

		_G.TMMXFarm = true;
		while (_G.TMMXFarm) do
			RunService.Heartbeat:Wait();
			print(pcall(FarmGift));
		end;
	end)
	local main = Window:Tab("anti cheat bypass")
	main:Button("anticheat bypass gui v1", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Defy-cloud/Scripts/refs/heads/main/ACBPSOPENSOURCE",true))()
	end)
	main:Button("anticheat bypass", function()
		--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Next1x/Nextix./main/UniversalACBypass"))()
	end)
	local main=Window:Tab("more + desync gui")
	main:Button("delete UI", function()
		local ry7845t643ygfeyfgeuwgf = "UILibrary"
		local chjtfujtrug=game:GetService("CoreGui")
		local fhgjaerghewrgjthewiu = chjtfujtrug:FindFirstChild(ry7845t643ygfeyfgeuwgf)
		if fhgjaerghewrgjthewiu then
			fhgjaerghewrgjthewiu:Destroy()
		end
	end)
	main:Button("PCRBLX HUB 163 GAMES SUPPORTED", function()
		--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
		loadstring(game:HttpGet("https://raw.githubusercontent.com/PCRBLXHUB/PCRBLX-HUB/refs/heads/main/pcrblxhub.lua",true))()
	end)
	main:Button("auto farm v4", function()
		local debrisclient= workspace.DebrisClient
		dc = debrisclient
		local Classnamne = "Model"
		dc.ChildAdded:Connect(function (ch)
			if ch:IsA(Classnamne) then
				for i,v in pairs(ch:GetChildren()) do
					if v:IsA("BasePart") then
						local hrp=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
						firetouchinterest(hrp, v, 0)
						firetouchinterest(hrp, v, 1)

						firetouchinterest(v, hrp, 1)
						firetouchinterest(v, hrp, 0)
					end
				end
			end
		end)
	end)
	main:Button("kill all", function()
		local lp=game:GetService("Players").LocalPlayer
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= lp.Name then
				local character = v.Character
				if character then
					for i,v in pairs(lp.Character:GetChildren()) do
						if v:IsA("BasePart") then
							firetouchinterest(v, character.HumanoidRootPart, 0)
							firetouchinterest(v, character.HumanoidRootPart, 1)
							firetouchinterest(character.HumanoidRootPart, v, 0)
							firetouchinterest(character.HumanoidRootPart, v, 1)
							--[[
							0)
							
							]]
						end
					end
				end
			end
		end
	end)
	main:Button("30 speed", function()
		local lp=game:GetService("Players").LocalPlayer
		local character = lp.Character
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.WalkSpeed = 30
	end)
	main:Button("desync UI", function()
		local mixaUiLIB = loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/WfTHwCvXlhE0NZAm/raw"))()-- creating the library
		lib = mixaUiLIB
		local window = lib:CreateWindow("desync") -- use this to create a window
		local main = window:Tab("desync")
		main:Button("F1 key desync", function()
			local hotkey = _G.desyncHotkey or Enum.KeyCode.F1

			local uis = game:GetService("UserInputService")
			local lp = game.Players.LocalPlayer
			local desyncActive = false
			local mainCharacter = nil
			local deathConnections = {}


			function deactivate()
				desyncActive = false

				for i, connection in pairs(deathConnections) do
					connection:Disconnect()
					table.remove(deathConnections, i)
				end

				mainCharacter.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame
				lp.Character:Destroy()
				local oldctype = game.Workspace.CurrentCamera.CameraType
				game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
				task.wait()
				lp.Character = mainCharacter
				game.Workspace.CurrentCamera.CameraSubject = mainCharacter.Humanoid
				game.Workspace.CurrentCamera.CameraType = oldctype
				mainCharacter.Animate.Enabled = false
				mainCharacter.Animate.Enabled = true
			end


			uis.InputBegan:Connect(function(input, gameProcessed)
				if not gameProcessed and input.KeyCode == hotkey then
					if desyncActive then
						deactivate()
					else
						desyncActive = true
						mainCharacter = lp.Character
						local oldArchivable = mainCharacter.Archivable
						mainCharacter.Archivable = true
						local clone = mainCharacter:Clone()
						mainCharacter.Archivable = oldArchivable
						clone.Parent = game.Workspace
						local oldctype = game.Workspace.CurrentCamera.CameraType
						game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
						task.wait()
						lp.Character = clone
						game.Workspace.CurrentCamera.CameraSubject = clone.Humanoid
						game.Workspace.CurrentCamera.CameraType = oldctype
						clone.Animate.Enabled = false
						clone.Animate.Enabled = true

						-- handle death and stuff
						table.insert(deathConnections, mainCharacter.Humanoid.Died:Connect(function()
							deactivate()
						end))
						table.insert(deathConnections, clone.Humanoid.Died:Connect(function()
							deactivate()
						end))
					end
				end
			end)
		end)
		main:Button("E key desync", function()
			local hotkey = _G.desyncHotkey or Enum.KeyCode.E

			local uis = game:GetService("UserInputService")
			local lp = game.Players.LocalPlayer
			local desyncActive = false
			local mainCharacter = nil
			local deathConnections = {}


			function deactivate()
				desyncActive = false

				for i, connection in pairs(deathConnections) do
					connection:Disconnect()
					table.remove(deathConnections, i)
				end

				mainCharacter.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame
				lp.Character:Destroy()
				local oldctype = game.Workspace.CurrentCamera.CameraType
				game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
				task.wait()
				lp.Character = mainCharacter
				game.Workspace.CurrentCamera.CameraSubject = mainCharacter.Humanoid
				game.Workspace.CurrentCamera.CameraType = oldctype
				mainCharacter.Animate.Enabled = false
				mainCharacter.Animate.Enabled = true
			end


			uis.InputBegan:Connect(function(input, gameProcessed)
				if not gameProcessed and input.KeyCode == hotkey then
					if desyncActive then
						deactivate()
					else
						desyncActive = true
						mainCharacter = lp.Character
						local oldArchivable = mainCharacter.Archivable
						mainCharacter.Archivable = true
						local clone = mainCharacter:Clone()
						mainCharacter.Archivable = oldArchivable
						clone.Parent = game.Workspace
						local oldctype = game.Workspace.CurrentCamera.CameraType
						game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
						task.wait()
						lp.Character = clone
						game.Workspace.CurrentCamera.CameraSubject = clone.Humanoid
						game.Workspace.CurrentCamera.CameraType = oldctype
						clone.Animate.Enabled = false
						clone.Animate.Enabled = true

						-- handle death and stuff
						table.insert(deathConnections, mainCharacter.Humanoid.Died:Connect(function()
							deactivate()
						end))
						table.insert(deathConnections, clone.Humanoid.Died:Connect(function()
							deactivate()
						end))
					end
				end
			end)
		end)
	end)
end)
