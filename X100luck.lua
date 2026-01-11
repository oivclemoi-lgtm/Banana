-- x100 LUCK 🍀 | Compact UI Version | Delta OK

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local plr = Players.LocalPlayer

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "x100LuckUI"
gui.ResetOnSpawn = false
gui.Parent = plr:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 230, 0, 130) -- 👈 nhỏ hơn
frame.Position = UDim2.new(0.5, -115, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(20, 60, 35)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 215, 0)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -36, 0, 30)
title.Position = UDim2.new(0, 10, 0, 6)
title.BackgroundTransparency = 1
title.Text = "🍀 x100 LUCK"
title.Font = Enum.Font.GothamBlack
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(180,255,180)
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 26, 0, 26)
close.Position = UDim2.new(1, -32, 0, 6)
close.Text = "✕"
close.Font = Enum.Font.GothamBlack
close.TextSize = 16
close.TextColor3 = Color3.fromRGB(255,220,120)
close.BackgroundColor3 = Color3.fromRGB(30, 80, 50)
close.BorderSizePixel = 0
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 22)
status.Position = UDim2.new(0, 0, 0, 44)
status.BackgroundTransparency = 1
status.Text = "STATUS: OFF"
status.Font = Enum.Font.GothamBold
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,170,170)

local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0, 160, 0, 38)
toggle.Position = UDim2.new(0.5, -80, 0, 80)
toggle.Text = "ON"
toggle.Font = Enum.Font.GothamBlack
toggle.TextSize = 16
toggle.TextColor3 = Color3.fromRGB(20,60,30)
toggle.BackgroundColor3 = Color3.fromRGB(120,255,140)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

-- Icon ẩn/hiện
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 46, 0, 46)
icon.Position = UDim2.new(0, 16, 0.5, -23)
icon.Text = "🍀"
icon.Font = Enum.Font.GothamBlack
icon.TextSize = 22
icon.TextColor3 = Color3.fromRGB(180,255,180)
icon.BackgroundColor3 = Color3.fromRGB(20, 60, 35)
icon.BackgroundTransparency = 0.2
icon.BorderSizePixel = 0
icon.Visible = false
icon.Active = true
icon.Draggable = true
Instance.new("UICorner", icon).CornerRadius = UDim.new(1,0)

local iconStroke = Instance.new("UIStroke", icon)
iconStroke.Color = Color3.fromRGB(255,215,0)
iconStroke.Thickness = 2

-- ===== LOGIC =====
local enabled = false
local fruits = {
	"Leopard","Dragon","Kitsune","Dough","Venom",
	"Spirit","Control","Shadow","Mammoth","T-Rex"
}

local function notify(msg)
	StarterGui:SetCore("SendNotification", {
		Title = "🍀 x100 LUCK",
		Text = msg,
		Duration = 4
	})
end

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		status.Text = "STATUS: ON"
		status.TextColor3 = Color3.fromRGB(150,255,150)
		toggle.Text = "OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(255,220,120)

		local fruit = fruits[math.random(1,#fruits)]
		notify("Bạn đã random ra trái "..fruit.." — trái xịn nhất game 😎🍎")
	else
		status.Text = "STATUS: OFF"
		status.TextColor3 = Color3.fromRGB(255,170,170)
		toggle.Text = "ON"
		toggle.BackgroundColor3 = Color3.fromRGB(120,255,140)
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
