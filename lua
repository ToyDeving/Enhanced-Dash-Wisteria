local plr = game.Players.LocalPlayer
local enabled = false
local UIS = game:GetService("UserInputService")
local val
local connect
local function add()
	UIS.InputBegan:Connect(function(input, gpe)
		local char = plr.Character
		if input.KeyCode == Enum.KeyCode.LeftAlt then
			if enabled == false then
				enabled = true
				if connect then connect:Disconnect() connect = nil end
				connect = char.HumanoidRootPart.ChildAdded:Connect(function(added)
					if added:IsA("BodyVelocity") and added.Name ~= "NewBV" and enabled == true then
						clone = added:Clone()
						clone.MaxForce = Vector3.new(90000,90000,90000)
						clone.Velocity = char.HumanoidRootPart.CFrame.LookVector * 175
						added:Destroy()
						clone.Name = "NewBV"
						clone.Parent = char.HumanoidRootPart
						game.Debris:AddItem(clone, 0.2)
					end
				end)
			elseif enabled == true then
				enabled = false
				if connect then connect:Disconnect() connect = nil end
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
end
add()
plr.CharacterRemoving:Connect(function()
	if connect then connect:Disconnect() connect = nil end
	enabled = false
	add()
end)
script.Parent = plr.PlayerScripts
