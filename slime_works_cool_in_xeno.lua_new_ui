local player = game:GetService("Players").LocalPlayer 
if game.PlaceId == 394773622 then
	local Luna = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/luna", true))()
	local Window = Luna:CreateWindow({
		Name = "luma hub | revenge of slimes", -- This Is Title Of Your Window
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
		DiscordInvite = "nodisc. sorry",
		Icon = 84442594910404,
	})
	local Tab = Window:CreateTab({
		Name = "server destruction",
		Icon = "view_in_ar",
		ImageSource = "Material",
		ShowTitle = true -- This will determine whether the big header text in the tab will show
	})
	local Button = Tab:CreateButton({
		Name = "kick all",
		Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
		Callback = function()
			for _, plr in ipairs(game.Players:GetPlayers()) do
				if plr ~= player then
					coroutine.wrap(function()
						local args = {
							[1] = plr.Backpack
						}

						game:GetService("Players").LocalPlayer.Character.DeleteTool.LocalScript.RF:InvokeServer(unpack(args))
					end)()
				end
			end
		end
	})
	local Button = Tab:CreateButton({
		Name = "punish all",
		Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
		Callback = function()
			for _, plr in ipairs(game.Players:GetPlayers()) do
				if plr ~= player then
					coroutine.wrap(function()
						local args = {
							[1] = plr.Character.Humanoid
						}

						game:GetService("Players").LocalPlayer.Character.DeleteTool.LocalScript.RF:InvokeServer(unpack(args))
					end)()
				end
			end
		end
	})
	local Button = Tab:CreateButton({
		Name = "kill all",
		Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
		Callback = function()
			for _, plr in ipairs(game.Players:GetPlayers()) do
				if plr ~= player then
					coroutine.wrap(function()
						local args = {
							[1] = plr.Character.Head.Mesh
						}

						game:GetService("Players").LocalPlayer.Character.DeleteTool.LocalScript.RF:InvokeServer(unpack(args))
					end)()
				end
			end
		end
	})
	local Button = Tab:CreateButton({
		Name = "destroy game",
		Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
		Callback = function()
			for _, part in ipairs(workspace:GetDescendants()) do
				if part:IsA("BasePart") then
					coroutine.wrap(function()
						local args = {
							[1] = part
						}

						game:GetService("Players").LocalPlayer.Character.DeleteTool.LocalScript.RF:InvokeServer(unpack(args))
					end)()
				end
			end
		end
	})
	local Tab = Window:CreateTab({
		Name = "slimes",
		Icon = "view_in_ar",
		ImageSource = "Material",
		ShowTitle = true -- This will determine whether the big header text in the tab will show
	})
	local Button = Tab:CreateButton({
		Name = "shoot all",
		Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
		Callback = function()
			for i = 0, 8 do
				for _, part in ipairs(workspace:GetDescendants()) do
					if part:IsA("BasePart") and part.Name == "Slime" then
						local args = {
							[1] = part.Position,
							[2] = "skill" .. tostring(i)
						}

						game:GetService("Players").LocalPlayer.Character.Bow.Shoot.RemoteEvent:FireServer(unpack(args))
					end
				end
			end
		end
	})
	local Tab = Window:CreateTab({
		Name = "auto farm",
		Icon = "view_in_ar",
		ImageSource = "Material",
		ShowTitle = true -- This will determine whether the big header text in the tab will show
	})
	local Button = Tab:CreateButton({
		Name = "anti afk",
		Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
		Callback = function()
			--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
			wait(0.5)
			local gui = Instance.new("ScreenGui")
			local header = Instance.new("TextLabel")
			local frame = Instance.new("Frame")
			local footer = Instance.new("TextLabel")
			local status = Instance.new("TextLabel")

			gui.Parent = game.CoreGui
			gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

			-- Header Design
			header.Parent = gui
			header.Active = true
			header.BackgroundColor3 = Color3.new(0, 0, 0.4)
			header.Draggable = true
			header.Position = UDim2.new(0.7, 0, 0.1, 0)
			header.Size = UDim2.new(0, 400, 0, 50)
			header.Font = Enum.Font.Fantasy
			header.Text = "Ultimate Anti-AFK"
			header.TextColor3 = Color3.new(1, 1, 1)
			header.TextSize = 24

			-- Frame Design
			frame.Parent = header
			frame.BackgroundColor3 = Color3.new(0, 0, 0.3)
			frame.Position = UDim2.new(0, 0, 1, 0)
			frame.Size = UDim2.new(0, 400, 0, 100)

			-- Footer Design
			footer.Parent = frame
			footer.BackgroundColor3 = Color3.new(0, 0, 0.4)
			footer.Position = UDim2.new(0, 0, 0.8, 0)
			footer.Size = UDim2.new(0, 400, 0, 20)
			footer.Font = Enum.Font.GothamBold
			footer.Text = "Made by Genesis_ui"
			footer.TextColor3 = Color3.new(0.8, 0.8, 1)
			footer.TextSize = 18

			-- Status Design
			status.Parent = frame
			status.BackgroundColor3 = Color3.new(0, 0, 0.5)
			status.Position = UDim2.new(0, 0, 0.2, 0)
			status.Size = UDim2.new(0, 400, 0, 40)
			status.Font = Enum.Font.Gotham
			status.Text = "Status: Active"
			status.TextColor3 = Color3.new(0.8, 1, 0.8)
			status.TextSize = 22

			-- Anti-AFK Logic
			local virtualUser = game:service('VirtualUser')
		
			game:service('Players').LocalPlayer.Idled:connect(function()
				virtualUser:CaptureController()
				virtualUser:ClickButton2(Vector2.new())
				status.Text = "Kicked AFK detection! Still active."
				wait(2)
				status.Text = "Status: Active"
			end)
		end
	})
	local Button = Tab:CreateButton({
		Name = "farm",
		Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
		Callback = function()
			spawn(function()
				while wait(0.1) do
					if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bow") then
						game:GetService("Players").LocalPlayer.Backpack.Bow.Parent = game:GetService("Players").LocalPlayer.Character
					end
				end
			end)
			
			spawn(function()
				while wait(3) do
					for i = 0, 8 do
						for _, part in ipairs(workspace:GetDescendants()) do
							if part:IsA("BasePart") and part.Name == "Slime" then
								local args = {
									[1] = part.Position,
									[2] = "skill" .. tostring(i)
								}

								game:GetService("Players").LocalPlayer.Character.Bow.Shoot.RemoteEvent:FireServer(unpack(args))
							end
						end
					end
				end
			end)
			spawn(function ()
				while wait(0.1) do
					game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
					if globals and globals.teleport then
						globals.teleport(Vector3.new(0,3e1,0))
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3e1,0)
					end
				end
			end)
			for _, con in next, getconnections(game.Players.LocalPlayer.Idled) do con:Disconnect() end
		end
	})
end
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("3370544454_SLIME-"..tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)) then
	function inject(i)
		local s,e = pcall(function()
			scr={}
			scr.screwu=script
			local scrwe=scr.screwu.Source
			print(scrwe)
			local function delete(pard)
				return pard:Destroy()
			end
			wait(0.5)
			print(i)
			scr.die=function () delete(scr.screwu) end
			scr.die()
			
		end)
	loadstring(s or e,"BOOOOOOOOOOIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII")
	end
	inject("bye")
end
function get()
	local d="3370544454_SLIME"
print(d)
end
