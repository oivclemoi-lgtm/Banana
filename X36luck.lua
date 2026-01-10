-- 🍀 x36 Luck Toggle Script

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local enabled = false

-- UI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 260, 0, 150)
frame.Position = UDim2.new(0.5, -130, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,16)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "🍀 x36 Luck"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(0,255,150)

local status = Instance.new("TextLabel", frame)
status.Position = UDim2.new(0,0,0,45)
status.Size = UDim2.new(1,0,0,25)
status.BackgroundTransparency = 1
status.Text = "Status: OFF"
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,100,100)

local toggle = Instance.new("TextButton", frame)
toggle.Position = UDim2.new(0.2,0,1,-55)
toggle.Size = UDim2.new(0.6,0,0,35)
toggle.Text = "TURN ON"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)
toggle.TextColor3 = Color3.fromRGB(255,255,255)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

-- Toggle logic
toggle.MouseButton1Click:Connect(function()
    enabled = not enabled

    if enabled then
        status.Text = "Status: ON (x36)"
        status.TextColor3 = Color3.fromRGB(0,255,150)
        toggle.Text = "TURN OFF"
        toggle.BackgroundColor3 = Color3.fromRGB(0,150,100)

        StarterGui:SetCore("SendNotification",{
            Title = "🍀 x36 Luck",
            Text = "x36 Luck Activated!",
            Duration = 3
        })
    else
        status.Text = "Status: OFF"
        status.TextColor3 = Color3.fromRGB(255,100,100)
        toggle.Text = "TURN ON"
        toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)

        StarterGui:SetCore("SendNotification",{
            Title = "🍀 x36 Luck",
            Text = "x36 Luck Disabled!",
            Duration = 3
        })
    end
end)
