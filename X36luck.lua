-- x36luck 🍀 | Simple UI | Delta OK

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "x36luckUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- MAIN FRAME
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 260, 0, 150)
frame.Position = UDim2.new(0.5, -130, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(40, 120, 60)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 18)

-- BORDER GOLD
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 215, 0)
stroke.Thickness = 2

-- TITLE
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 35)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Text = "🍀 x36luck"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(200,255,200)
title.TextXAlignment = Enum.TextXAlignment.Left

-- CLOSE BUTTON
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 28, 0, 28)
close.Position = UDim2.new(1, -34, 0, 6)
close.Text = "✕"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255,220,120)
close.BackgroundColor3 = Color3.fromRGB(60,100,60)
close.BorderSizePixel = 0
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

-- STATUS
local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 25)
status.Position = UDim2.new(0, 0, 0, 45)
status.BackgroundTransparency = 1
status.Text = "STATUS: OFF"
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,180,180)

-- TOGGLE BUTTON
local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0.7, 0, 0, 40)
toggle.Position = UDim2.new(0.15, 0, 0, 80)
toggle.Text = "ON"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.TextColor3 = Color3.fromRGB(30,60,30)
toggle.BackgroundColor3 = Color3.fromRGB(120,255,120)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

-- ICON (SHOW AGAIN)
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 46, 0, 46)
icon.Position = UDim2.new(0, 15, 0.5, -23)
icon.Text = "🍀"
icon.Font = Enum.Font.GothamBold
icon.TextSize = 22
icon.TextColor3 = Color3.fromRGB(200,255,200)
icon.BackgroundColor3 = Color3.fromRGB(40,100,60)
icon.BackgroundTransparency = 0.15
icon.BorderSizePixel = 0
icon.Visible = false
icon.Active = true
icon.Draggable = true
Instance.new("UICorner", icon).CornerRadius = UDim.new(1,0)

local iconStroke = Instance.new("UIStroke", icon)
iconStroke.Color = Color3.fromRGB(255,215,0)
iconStroke.Thickness = 2

-- LOGIC
local enabled = false

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		status.Text = "STATUS: ON (x36🍀)"
		status.TextColor3 = Color3.fromRGB(120,255,120)
		toggle.Text = "OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(255,220,120)
	else
		status.Text = "STATUS: OFF"
		status.TextColor3 = Color3.fromRGB(255,180,180)
		toggle.Text = "ON"
		toggle.BackgroundColor3 = Color3.fromRGB(120,255,120)
	end
end)

close.MouseButton1Click:Connect(function()
	frame.Visible = false
	icon.Visible = true
end)

icon.MouseButton1Click:Connect(function()
	icon.Visible = false
	frame.Visible = true
end)
