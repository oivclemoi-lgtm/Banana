-- 🍀 x36 Luck | Fancy UI | Drag + Slide

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local enabled = false
local side = "center" -- left / right / center

-- GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,20)

-- Gradient
local grad = Instance.new("UIGradient", frame)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 150))
}
grad.Rotation = 45

-- Inner dark layer
local inner = Instance.new("Frame", frame)
inner.Size = UDim2.new(1, -6, 1, -6)
inner.Position = UDim2.new(0, 3, 0, 3)
inner.BackgroundColor3 = Color3.fromRGB(15,15,15)
inner.BorderSizePixel = 0
Instance.new("UICorner", inner).CornerRadius = UDim.new(0,18)

-- Title
local title = Instance.new("TextLabel", inner)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "🍀 x36 LUCK"
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255,255,255)

-- Status
local status = Instance.new("TextLabel", inner)
status.Position = UDim2.new(0,0,0,45)
status.Size = UDim2.new(1,0,0,25)
status.BackgroundTransparency = 1
status.Text = "STATUS: OFF"
status.Font = Enum.Font.GothamBold
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,100,100)

-- Toggle Button
local toggle = Instance.new("TextButton", inner)
toggle.Position = UDim2.new(0.15,0,0,80)
toggle.Size = UDim2.new(0.7,0,0,40)
toggle.Text = "ENABLE"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.TextColor3 = Color3.fromRGB(0,0,0)
toggle.BackgroundColor3 = Color3.fromRGB(0,255,150)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

-- Slide Button
local slide = Instance.new("TextButton", inner)
slide.Position = UDim2.new(0.3,0,1,-38)
slide.Size = UDim2.new(0.4,0,0,28)
slide.Text = "⇄ MOVE"
slide.Font = Enum.Font.Gotham
slide.TextSize = 13
slide.TextColor3 = Color3.fromRGB(255,255,255)
slide.BackgroundColor3 = Color3.fromRGB(40,40,40)
slide.BorderSizePixel = 0
Instance.new("UICorner", slide).CornerRadius = UDim.new(1,0)

-- Toggle logic
toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		status.Text = "STATUS: ON (x36)"
		status.TextColor3 = Color3.fromRGB(0,255,150)
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(255,80,80)

		StarterGui:SetCore("SendNotification",{
			Title = "🍀 x36 Luck",
			Text = "Luck x36 Activated!",
			Duration = 3
		})
	else
		status.Text = "STATUS: OFF"
		status.TextColor3 = Color3.fromRGB(255,100,100)
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(0,255,150)

		StarterGui:SetCore("SendNotification",{
			Title = "🍀 x36 Luck",
			Text = "Luck Disabled!",
			Duration = 3
		})
	end
end)

-- Slide Left / Right / Center
slide.MouseButton1Click:Connect(function()
	local target
	if side == "center" then
		target = UDim2.new(0, 15, 0.5, -90)
		side = "left"
	elseif side == "left" then
		target = UDim2.new(1, -315, 0.5, -90)
		side = "right"
	else
		target = UDim2.new(0.5, -150, 0.5, -90)
		side = "center"
	end

	TweenService:Create(
		frame,
		TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{Position = target}
	):Play()
end)
