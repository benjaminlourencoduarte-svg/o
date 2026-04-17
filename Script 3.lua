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

            spawn(function()
                while wait(0.3) do
                    firetouchinterest(part, player.Character.HumanoidRootPart, 1)
                    firetouchinterest(part, player.Character.HumanoidRootPart, 2)
                end
            end)
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
