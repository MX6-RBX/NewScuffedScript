local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local GUI = Player.PlayerGui:WaitForChild("GUI")

--local Cash = GUI.Money
local Furnace
local FurnaceBase
local Drop
local Tycoon = Player.PlayerTycoon.Value
local AutoRebirth = false

function UpdateButtons()--updates buttons
	for i,v in pairs(Tycoon:GetDescendants ()) do
		if v:FindFirstChild("Drop") then
			Drop = v:FindFirstChild("Drop")
		elseif v:IsA("BasePart") and v:FindFirstChild("Lava") or v:FindFirstChild("MiniLava") then
			Furnace =v:FindFirstChild("Lava") 
			print("FOUND THE SHIT",Furnace.Name)
			FurnaceBase = v:FindFirstChild("MiniLava")
		end
	end
end


function MoveUpgraders()


		for i,v in pairs(game:GetService("Workspace").Tycoons:GetDescendants()) do
			if v.Name == "Upgrade" and v:IsA("BasePart") or v:IsA("MeshPart")  then 
				v.Size = Furnace.Size +Vector3.new(2,2,2)
				v.CFrame = FurnaceBase.CFrame + Vector3.new(0,1,0)
				v.CanCollide = false
			end
		end
end

UIS.InputBegan:Connect(function(Input)
	if Input.KeyCode == Enum.KeyCode.K then
	    UpdateButtons()
	    wait(0)
	    MoveUpgraders()
	elseif Input.KeyCode == Enum.KeyCode.N then
        AutoRebirth = not AutoRebirth
	end
end)

while wait(0.01) do
    if AutoRebirth then
        local Rebirthed = game:GetService("ReplicatedStorage").resources.remotes.remote_functions.rebirth:InvokeServer()
        if Rebirthed then
            wait(0.1)
            game:GetService("ReplicatedStorage").resources.remotes.remote_functions.layouts:InvokeServer("Load", "Layout1")
            UpdateButtons()
            MoveUpgraders()
            wait(.5)
            else
                
        end
    end
end


