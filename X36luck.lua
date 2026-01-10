-- 🍀 x36 Luck | Green Theme | Transparent + Gold Border

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local enabled = false
local side = "center"

-- GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

-- ===== MAIN FRAME =====
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
frame.BackgroundTransparency = 0.25 -- 👈 trong suốt
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 20)

-- Gold Border
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 215, 0) -- vàng
stroke.Transparency = 0.1

-- Gradient
local grad = Instance.new("UIGradient", frame)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 255, 120)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 200, 120))
}
grad.Rotation = 45

-- Inner
local inner = Instance.new("Frame", frame)
inner.Size = UDim2.new(1, -6, 1, -6)
inner.Position = UDim2.new(0, 3, 0, 3)
inner.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
inner.BackgroundTransparency = 0.15
inner.BorderSizePixel = 0
Instance.new("UICorner", inner).CornerRadius = UDim.new(0, 18)

-- Title
local title = Instance.new("TextLabel", inner)
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🍀 x36 LUCK"
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(200, 255, 200)
title.TextXAlignment = Left

-- Close X
local closeBtn = Instance.new("TextButton", inner)
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -34, 0, 6)
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.fromRGB(255, 220, 120)
closeBtn.BackgroundColor3 = Color3.fromRGB(30, 50, 30)
closeBtn.BackgroundTransparency = 0.2
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1,0)

-- Status
local status = Instance.new("TextLabel", inner)
status.Position = UDim2.new(0,0,0,45)
status.Size = UDim2.new(1,0,0,25)
status.BackgroundTransparency = 1
status.Text = "STATUS: OFF"
status.Font = Enum.Font.GothamBold
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,180,180)

-- Toggle
local toggle = Instance.new("TextButton", inner)
toggle.Position = UDim2.new(0.15,0,0,80)
toggle.Size = UDim2.new(0.7,0,0,40)
toggle.Text = "ENABLE"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.TextColor3 = Color3.fromRGB(20, 40, 20)
toggle.BackgroundColor3 = Color3.fromRGB(120, 255, 120)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

-- Move button
local slide = Instance.new("TextButton", inner)
slide.Position = UDim2.new(0.3,0,1,-38)
slide.Size = UDim2.new(0.4,0,0,28)
slide.Text = "⇄ MOVE"
slide.Font = Enum.Font.Gotham
slide.TextSize = 13
slide.TextColor3 = Color3.fromRGB(220,255,220)
slide.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
slide.BackgroundTransparency = 0.15
slide.BorderSizePixel = 0
Instance.new("UICorner", slide).CornerRadius = UDim.new(1,0)

-- ===== ICON =====
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 46, 0, 46)
icon.Position = UDim2.new(0, 15, 0.5, -23)
icon.Text = "🍌"
icon.Font = Enum.Font.GothamBlack
icon.TextSize = 22
icon.TextColor3 = Color3.fromRGB(180, 255, 180)
icon.BackgroundColor3 = Color3.fromRGB(25, 50, 25)
icon.BackgroundTransparency = 0.2
icon.BorderSizePixel = 0
icon.Visible = false
icon.Active = true
icon.Draggable = true
Instance.new("UICorner", icon).CornerRadius = UDim.new(1,0)

local iconStroke = Instance.new("UIStroke", icon)
iconStroke.Thickness = 2
iconStroke.Color = Color3.fromRGB(255,215,0)

-- ===== LOGIC =====
toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		status.Text = "STATUS: ON (x36)"
		status.TextColor3 = Color3.fromRGB(120,255,120)
		toggle.Text = "DISABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(255,200,120)
		StarterGui:SetCore("SendNotification",{Title="🍀 x36 Luck",Text="Luck Activated!",Duration=3})
	else
		status.Text = "STATUS: OFF"
		status.TextColor3 = Color3.fromRGB(255,180,180)
		toggle.Text = "ENABLE"
		toggle.BackgroundColor3 = Color3.fromRGB(120,255,120)
		StarterGui:SetCore("SendNotification",{Title="🍀 x36 Luck",Text="Luck Disabled!",Duration=3})
	end
end)

slide.MouseButton1Click:Connect(function()
	local target
	if side == "center" then
		target = UDim2.new(0, 15, 0.5, -90); side = "left"
	elseif side == "left" then
		target = UDim2.new(1, -315, 0.5, -90); side = "right"
	else
		target = UDim2.new(0.5, -150, 0.5, -90); side = "center"
	end
	TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Quart), {Position = target}):Play()
end)

closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
	icon.Visible = true
end)

icon.MouseButton1Click:Connect(function()
	icon.Visible = false
	frame.Visible = true
end)
