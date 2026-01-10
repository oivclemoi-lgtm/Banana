-- x36 LUCK 🍀 | Clean UI | Rebuild

local plr = game:GetService("Players").LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "x36luck_rebuild"
gui.ResetOnSpawn = false
gui.Parent = plr:WaitForChild("PlayerGui")

-- MAIN PANEL
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 420, 0, 220)
main.Position = UDim2.new(0.5, -210, 0.5, -110)
main.BackgroundColor3 = Color3.fromRGB(10, 35, 20)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 22)

-- GOLD BORDER
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(255, 215, 0)
stroke.Thickness = 3

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "🍀  x36 LUCK"
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(170, 255, 170)
title.TextStrokeTransparency = 0.6

-- CLOSE X
local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0, 36, 0, 36)
close.Position = UDim2.new(1, -46, 0, 12)
close.Text = "✕"
close.Font = Enum.Font.GothamBlack
close.TextSize = 20
close.TextColor3 = Color3.fromRGB(255, 220, 120)
close.BackgroundColor3 = Color3.fromRGB(20, 60, 35)
close.BorderSizePixel = 0
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

-- STATUS
local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 80)
status.BackgroundTransparency = 1
status.Text = "STATUS : OFF"
status.Font = Enum.Font.GothamBold
status.TextSize = 18
status.TextColor3 = Color3.fromRGB(255, 160, 160)

-- TOGGLE
local toggle = Instance.new("TextButton", main)
toggle.Size = UDim2.new(0, 200, 0, 55)
toggle.Position = UDim2.new(0.5, -100, 0, 130)
toggle.Text = "ON"
toggle.Font = Enum.Font.GothamBlack
toggle.TextSize = 20
toggle.TextColor3 = Color3.fromRGB(20, 50, 20)
toggle.BackgroundColor3 = Color3.fromRGB(120, 255, 140)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

-- ICON (SHOW AGAIN)
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 60, 0, 60)
icon.Position = UDim2.new(0, 20, 0.5, -30)
icon.Text = "🍀"
icon.Font = Enum.Font.GothamBlack
icon.TextSize = 26
icon.TextColor3 = Color3.fromRGB(170,255,170)
icon.BackgroundColor3 = Color3.fromRGB(10, 40, 25)
icon.BackgroundTransparency = 0.15
icon.BorderSizePixel = 0
icon.Visible = false
icon.Active = true
icon.Draggable = true
Instance.new("UICorner", icon).CornerRadius = UDim.new(1,0)

local iconStroke = Instance.new("UIStroke", icon)
iconStroke.Color = Color3.fromRGB(255,215,0)
iconStroke.Thickness = 3

-- LOGIC
local on = false

toggle.MouseButton1Click:Connect(function()
	on = not on
	if on then
		status.Text = "STATUS : ON  (x36 🍀)"
		status.TextColor3 = Color3.fromRGB(150,255,150)
		toggle.Text = "OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(255,220,120)
	else
		status.Text = "STATUS : OFF"
		status.TextColor3 = Color3.fromRGB(255,160,160)
		toggle.Text = "ON"
		toggle.BackgroundColor3 = Color3.fromRGB(120,255,140)
	end
end)

close.MouseButton1Click:Connect(function()
	main.Visible = false
	icon.Visible = true
end)

icon.MouseButton1Click:Connect(function()
	icon.Visible = false
	main.Visible = true
end)
