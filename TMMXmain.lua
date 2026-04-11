local hrp=game.Players.LocalPlayer.Character.HumanoidRootPart
hrp.AssemblyLinearVelocity = Vector3.new(0,0,9999999999999999999999999999999999999999999999)
function notice(text,title,img,duration)
	local SG=game:GetService("StarterGui")
	SG:SetCore("SendNotification",{
		Title = title;
		Text = text;
		Icon = "rbxassetid://"..img;
		Duration = duration;
	})
end
function noclip()
	local player=game.Players.LocalPlayer
	local char=player.Character
	for i,v in pairs(char:GetChildren()) do
		if v:IsA("BasePart") then
			v.CanCollide=false
		end
	end
end
function setSimulationRadius(size)
	local player=game.Players.LocalPlayer
	if player.SimulationRadius then
		player.SimulationRadius=size
	end
end
setSimulationRadius(0)
function hipheight(hip)
	local player=game.Players.LocalPlayer
	local char=player.Character
	local humanoid=char.Humanoid
	local hipHeight=humanoid.HipHeight
	humanoid.HipHeight=hip
	return hipHeight
end
function goUnderGround()
	local player=game.Players.LocalPlayer
	local char=player.Character
	local humanoid=char.Humanoid
	local hipHeight=humanoid.HipHeight
	humanoid.HipHeight=-20
	wait(1)
	humanoid.HipHeight=hipHeight
end

function BypassAntiCheat()
	local player=game.Players.LocalPlayer
	spawn(function ()
		while true do
			local char=player.Character
			for i,v in pairs(char:GetChildren()) do
				if v:IsA("BasePart") then
					v.CanCollide=false
					v.Anchored=false
					v.Velocity=Vector3.new(0,5000,-9999999999999999999999999999999999999999)
				end
			end
			wait(0.1)
		end
	end)
end
function hearthBeat(func)
	local RUn=game:GetService("RunService")
	local connection
	connection=RUn.Heartbeat:Connect(function()
		func()
	end)
	return connection
end
function GodMode()
	local player=game.Players.LocalPlayer
	local char=player.Character
	local humanoid=char.Humanoid
	local health=humanoid.Health
	spawn(function ()while true do humanoid.Health=math.huge wait(0.1) end end)
	return health
end
function AntiRagDoll()
	local player=game.Players.LocalPlayer
	local char=player.Character
	for i,v in pairs(char:GetChildren()) do
		if v:IsA("BallSocketConstraint") then
			v:Destroy()
		elseif v:IsA("Attachment") then
			v:Destroy()
		end
	end
	local humanoid=char.Humanoid
	humanoid.BreakJointsOnDeath=false
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead,false)
end
function startAutoFarm()
	GodMode()
	noclip()
	hipheight(10)
	local dc=game.Workspace:WaitForChild("DebrisClient")
	dc.ChildAdded:Connect(function ()
		local coin=dc
		for i,v in pairs(coin:GetChildren()) do
			local CurrentPartSelectedToGet=v
			for i,v in pairs(CurrentPartSelectedToGet:GetChildren()) do
				if v:IsA("Model") then
					local model=v
					model:MoveTo(hrp.Postition)
				elseif v:IsA("BasePart") then
					local part=v
					hrp.CFrame=part.CFrame
					print("is an part")
				elseif v:IsA("Folder") then
					local folder=v
					fip =folder:GetChildren()
					print("is an folder")
					og=pairs(fip)
					for i,v in og do
						if v:IsA("BasePart") then
							notice("found Coin","INVIS auto farm",nil,5)
							local part=v
							hrp.CFrame=part.CFrame
							hipheight(0)
							if firetouchinterest then
								firetouchinterest(part, hrp, 1) 
								firetouchinterest(part, hrp, 0) 
							end
							wait(2)
							hipheight(10)
							print("is an BasePart")
						elseif v:IsA("Model") then
							local model=v
							model:MoveTo(hrp.Position)
							print("is an Model")
						elseif v:IsA("MeshPart") then
							local part=v
							hrp.CFrame=part.CFrame
							print("is an meshpart")
						end
					end
				end
			end
			local hh=Instance.new("Highlight",v)
			highlight=hh
			highlight.FillColor=Color3.new(0.184314, 1, 0)
			highlight.FillTransparency=0.5
			highlight.OutlineColor=Color3.new(1, 0.0627451, 0.952941)
			highlight.OutlineTransparency=0.5
			highlight.Adornee=v
			highlight.Parent=v
		end
	end)
	hearthBeat(noclip)
	hearthBeat(AntiRagDoll)
	hearthBeat(BypassAntiCheat)
	goUnderGround()
	wait(1)
	hipheight(10)
end
function FWOHH()
	GodMode()
	noclip()
	hipheight(0)
	local dc=game.Workspace:WaitForChild("DebrisClient")
	dc.ChildAdded:Connect(function ()
		local coin=dc
		for i,v in pairs(coin:GetChildren()) do
			local CurrentPartSelectedToGet=v
			for i,v in pairs(CurrentPartSelectedToGet:GetChildren()) do
				if v:IsA("Model") then
					local model=v
					model:MoveTo(hrp.Postition)
				elseif v:IsA("BasePart") then
					local part=v
					hrp.CFrame=part.CFrame
					print("is an part")
				elseif v:IsA("Folder") then
					local folder=v
					fip =folder:GetChildren()
					print("is an folder")
					og=pairs(fip)
					for i,v in og do
						if v:IsA("BasePart") then
							local part=v
							hrp.CFrame=part.CFrame
							if firetouchinterest then
								firetouchinterest(part, hrp, 1) 
								firetouchinterest(part, hrp, 0) 
							end
							print("is an BasePart")
						elseif v:IsA("Model") then
							local model=v
							model:MoveTo(hrp.Position)
							print("is an Model")
						elseif v:IsA("MeshPart") then
							local part=v
							hrp.CFrame=part.CFrame
							print("is an meshpart")
						end
					end
				end
			end
			local hh=Instance.new("Highlight",v)
			highlight=hh
			highlight.FillColor=Color3.new(0.0431373, 0.584314, 1)
			highlight.FillTransparency=0.5
			highlight.OutlineColor=Color3.new(0.74902, 0, 1)
			highlight.OutlineTransparency=0.5
			highlight.Adornee=v
			highlight.Parent=v
		end
	end)
	hearthBeat(noclip)
	hearthBeat(AntiRagDoll)
	hearthBeat(BypassAntiCheat)
	goUnderGround()
	wait(1)
	hipheight(10)
end



function esp()
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		local char=v.Character
		local highlight=Instance.new("Highlight",char)
		highlight.FillColor=Color3.new(0.184314, 1, 0)
		highlight.FillTransparency=0.5
		highlight.OutlineColor=Color3.new(1,0,0)
		if v.character:FindFirstChildOfClass("Tool") then
			local tool=v.Character:FindFirstChildOfClass("Tool")
			print(tool.Name)
			highlight.FillColor=Color3.new(1, 0.0392157, 0.0392157)
		end
	end
end
spawn(function ()
	while wait(0.1) do
		esp()
	end
end)
function ResizeHitBox(s)
	local player=game.Players.LocalPlayer
	local char=player.Character
	local humanoid=char.Humanoid
	local hitbox=char:WaitForChild("HumanoidRootPart")
	hitbox.Size=s
end
function reset()
	local player=game.Players.LocalPlayer
	local hum=player.Character.Humanoid
	hum.Health=0
	hum:SetStateEnabled(Enum.HumanoidStateType.Dead,true)
	hum:ChangeState(Enum.HumanoidStateType.Dead)
	hum:Destroy()
	local newhum=Instance.new("Humanoid",player.Character)
	newhum.BreakJointsOnDeath=false
	newhum:SetStateEnabled(Enum.HumanoidStateType.Dead,false)
	AntiRagDoll()
	BypassAntiCheat()
	GodMode()
	wait(2)
	newhum.Name= "IlIlIllIlIlIllllIIllllIIlIllI"
end
function OnAnticheattriggeredManyTimes()
	reset()
end
function reactonanticheattriggeredmanytimes()
	local maxtimes=13
	local times=0
	local player=game.Players.LocalPlayer
	local char=player.Character
	local humanoid=char.Humanoid
	local hrp=char.HumanoidRootPart
	while wait(0.1) do
		if hrp.CFrame==Vector3.new(0,0,0) then
			times=times+1
			if times>maxtimes then
				OnAnticheattriggeredManyTimes()
			end
		end

		if humanoid.HipHeight>10 then
			times=times+1
			if times>maxtimes then
				OnAnticheattriggeredManyTimes()
			end
		end
		print("Times: "..times)
	end
end
spawn(function ()
	while wait(0.1) do
		--spawn(function ()
		AntiRagDoll()
		BypassAntiCheat()
		noclip()
		--end)
	end
end)
GodMode()
noclip()
ResizeHitBox(Vector3.new(1,1,1))

local pg=game.Players.LocalPlayer.PlayerGui
local UI=Instance.new("ScreenGui",pg)
UI.Name="AutoFarm_VALUES"
UI.ResetOnSpawn=false
local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.1,0)
button.Text="20 hipheight"
button.MouseButton1Click:Connect(function ()
	hipheight(20)
end)
local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.2,0)
button.Text="15 hipheight"
button.MouseButton1Click:Connect(function ()
	hipheight(15)
end)
local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.3,0)
button.Text="invis farm (just hip heigh + no collision)"
button.MouseButton1Click:Connect(function ()
	startAutoFarm()
	local lp=game.Players.LocalPlayer
	local char=lp.Character

	lp.CharacterAdded:Connect(function () startAutoFarm()end)
	while wait(10) do
		startAutoFarm()
	end
end)

local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.4,0)
button.Text="delete hrp"
button.MouseButton1Click:Connect(function ()
	hrp:Destroy()
end)

local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.5,0)
button.Text="reset"
button.MouseButton1Click:Connect(function ()
	reset()
end)
local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.6,0)
button.Text="HIDE PLAYER"
button.MouseButton1Click:Connect(function ()
	hipheight(900000)
end)
local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.7,0)
button.Text="anchor"
button.MouseButton1Click:Connect(function ()
	local lp=game.Players.LocalPlayer
	local char=lp.Character
	for i,v in pairs(char:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Anchored=true
		end
	end
end)

local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.8,0)
button.Text="reset+Change Hrp's name "
button.MouseButton1Click:Connect(function ()
	reset()
	hrp.Name="TRrtlglrjgbkdshvokdhvdjvhcdkjgydsagcd"
	local uppertorso=game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso")
	uppertorso.Name="fgpifghioufuiohgfjujkghfdjighfdighfduighffdiughfiufhg"
end)
local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.1,0,0.9,0)
button.Text="fall"
button.MouseButton1Click:Connect(function ()
	local lp=game.Players.LocalPlayer
	local char=lp.Character
	local hum=char:FindFirstChild("Humanoid")
	hum:ChangeState(Enum.HumanoidStateType.FallingDown)
end)
local RightButton=Instance.new("TextButton",UI)
RightButton.Size=UDim2.new(0.1,0,0.1,0)
RightButton.Position=UDim2.new(0.2,0,0.1,0)
RightButton.Text="brickfy yourself"
RightButton.MouseButton1Click:Connect(function ()
	local lp=game.Players.LocalPlayer
	local char=lp.Character
	local hum=char:FindFirstChild("Humanoid")
	hum:Destroy()
end)
local RightButton=Instance.new("TextButton",UI)
RightButton.Size=UDim2.new(0.1,0,0.1,0)
RightButton.Position=UDim2.new(0.2,0,0.2,0)
RightButton.Text="re-install you hum"
RightButton.MouseButton1Click:Connect(function ()
	local Hum=Instance.new("Humanoid",game.Players.LocalPlayer.Character)
	Hum.Name="Humanoid"
	Hum.MaxHealth=math.huge
	Hum.Health=math.huge
end)
local RightButton=Instance.new("TextButton",UI)
RightButton.Size=UDim2.new(0.1,0,0.1,0)
RightButton.Position=UDim2.new(0.2,0,0.3,0)
RightButton.Text="platform"
RightButton.MouseButton1Click:Connect(function ()
	local platsize=Vector3.new(10,1,10)
	local plat=Instance.new("Part",workspace)
	plat.Size=platsize
	plat.Position=hrp.Position
	plat.Anchored=true
	spawn(function ()
		while wait() do
			plat.Position=hrp.Position-Vector3.new(0,1,0)
		end
	end)
end)
local button=Instance.new("TextButton",UI)
button.Size=UDim2.new(0.1,0,0.1,0)
button.Position=UDim2.new(0.2,0,0.4,0)
button.Text="delete yourself"
button.MouseButton1Click:Connect(function ()
	local lp=game.Players.LocalPlayer
	local char=lp.Character
	for i,v in pairs(char:GetChildren()) do
		if v:IsA("MeshPart") then
			v:Destroy()
		end
	end
end)
--yourselffkdiuog@yh$re(yiufg$3%e4rt5378
local rightbutton=Instance.new("TextButton",UI)
rightbutton.Size=UDim2.new(0.1,0,0.1,0)
rightbutton.Position=UDim2.new(0.2,0,0.5,0)
rightbutton.Text="0 hip height"
rightbutton.MouseButton1Click:Connect(function ()
	hipheight(0)
end)
local rightbutton=Instance.new("TextButton",UI)
rightbutton.Size=UDim2.new(0.1,0,0.1,0)
rightbutton.Position=UDim2.new(0.2,0,0.6,0)
rightbutton.Text="invis auto farm without hipheight"
rightbutton.MouseButton1Click:Connect(function ()
	ResizeHitBox(Vector3.new(100,100,100))
	FWOHH()
end)
local rightbutton=Instance.new("TextButton",UI)
rightbutton.Size=UDim2.new(0.1,0,0.1,0)
rightbutton.Position=UDim2.new(0.2,0,0.7,0)
rightbutton.Text="auto farm"
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
end
rightbutton.MouseButton1Click:Connect(function ()
	tweenautofarm()
end)
local rightbutton=Instance.new("TextButton",UI)
rightbutton.Size=UDim2.new(0.1,0,0.1,0)
rightbutton.Position=UDim2.new(0.2,0,0.8,0)
rightbutton.Text="0 grav"
function zerograv()
	workspace.Gravity=0
end
local rightbutton=Instance.new("TextButton",UI)
rightbutton.Size=UDim2.new(0.1,0,0.1,0)
rightbutton.Position=UDim2.new(0.3,0,0.1,0)
rightbutton.Text="900 grav"
function _e9e0e0grav()
	workspace.Gravity=900
end
rightbutton.MouseButton1Click:Connect(function ()
	_e9e0e0grav()
end)
local rightbutton=Instance.new("TextButton",UI)
rightbutton.Size=UDim2.new(0.1,0,0.1,0)
rightbutton.Position=UDim2.new(0.3,0,0.2,0)
rightbutton.Text="cat all"
function cat()
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
end
rightbutton.MouseButton1Click:Connect(function ()
	cat()
end)
local rightbutton=Instance.new("TextButton",UI)
rightbutton.Size=UDim2.new(0.1,0,0.1,0)
rightbutton.Position=UDim2.new(0.3,0,0.3,0)
rightbutton.Text="go underground"
rightbutton.MouseButton1Click:Connect(function ()
	hrp.CFrame = CFrame.new(hrp.CFrame,-5,hrp.CFrame)
end)

	local rightbutton=Instance.new("TextButton",UI)
	rightbutton.Size=UDim2.new(0.1,0,0.1,0)
	rightbutton.Position=UDim2.new(0.3,0,0.4,0)
	rightbutton.Text="murd esp"
	rightbutton.MouseButton1Click:Connect(function ()
		local murder = nil
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Backpack:FindFirstChild("Knife" or "knife") or v.Character:FindFirstChild("Knife" or "knife") then
				murder = v
				local HiGhlight = Instance.new("Highlight",murder.Character)
				HiGhlight.FillColor = Color3.new(0.262745, 0.113725, 1)
				HiGhlight.FillTransparency = 0.5
				local Head= murder.Character.Head
				local BillboardGui = Instance.new("BillboardGui",Head)
				BillboardGui.Size = UDim2.new(0, 200, 0, 50)
				BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
				BillboardGui.AlwaysOnTop = true
				local TextLabel = Instance.new("TextLabel",BillboardGui)
				TextLabel.Size = UDim2.new(1, 0, 1, 0)
				TextLabel.BackgroundTransparency = 1
				TextLabel.Text ="Murder"
			end
		end
	end)
local jv,ty = game:GetService("VoiceChatService").joinVoice,game:GetService("VoiceChatService"):joinVoice()
if jv then
	ty()
end
local Clip=setclipboard or toclipboard
Clip("TMMX - scripts")
