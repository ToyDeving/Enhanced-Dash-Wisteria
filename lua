local plr = game.Players.LocalPlayer
local char = plr.Character
local enabled = false
local UIS = game:GetService("UserInputService")
local val

UIS.InputBegan:Connect(function(input, gpe)
    if input.KeyCode == Enum.KeyCode.LeftAlt then
        if enabled == false then
            enabled = true
        elseif enabled == true then
            enabled = false
        end
    elseif input.KeyCode == Enum.KeyCode.RightAlt then
        if not val then
            val = Instance.new("NumberValue")
            val.Value = 10
            val.Parent = char.Effects.SpeedUp.Flat
        else
            if val then val:Destroy() val = nil end
        end
    end
end)

char.HumanoidRootPart.ChildAdded:Connect(function(added)
    if added:IsA("BodyVelocity") and enabled == true then
        clone = added:Clone()
        clone.MaxForce = Vector3.new(90000,90000,90000)
        clone.Velocity = char.HumanoidRootPart.CFrame.LookVector * 175
        added:Destroy()
        clone.Parent = char.HumanoidRootPart
        game.Debris:AddItem(clone, 0.2)
    end
end)
