-- ================== LOADING SCREEN ==================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.35

local panel = Instance.new("Frame", bg)
panel.Size = UDim2.new(0,360,0,160)
panel.Position = UDim2.new(0.5,-180,0.5,-80)
panel.BackgroundColor3 = Color3.fromRGB(20,60,40)
panel.BackgroundTransparency = 0.1
panel.BorderSizePixel = 0
panel.AnchorPoint = Vector2.new(0,0)
Instance.new("UICorner", panel).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke", panel)
stroke.Color = Color3.fromRGB(255,215,0)
stroke.Thickness = 2

local title = Instance.new("TextLabel", panel)
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "🍀 X100 LUCK"
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(180,255,180)

local sub = Instance.new("TextLabel", panel)
sub.Position = UDim2.new(0,0,0,40)
sub.Size = UDim2.new(1,0,0,40)
sub.BackgroundTransparency = 1
sub.Text = "Cảm ơn bạn đã đến với script của Phongcuto\nBanana Free Premium"
sub.Font = Enum.Font.Gotham
sub.TextSize = 14
sub.TextColor3 = Color3.fromRGB(220,255,220)

local barBg = Instance.new("Frame", panel)
barBg.Position = UDim2.new(0.1,0,1,-50)
barBg.Size = UDim2.new(0.8,0,0,14)
barBg.BackgroundColor3 = Color3.fromRGB(40,40,40)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(120,255,140)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

-- chạy loading %
TweenService:Create(
	bar,
	TweenInfo.new(5, Enum.EasingStyle.Linear),
	{Size = UDim2.new(1,0,1,0)}
):Play()

task.wait(5)
gui:Destroy()

-- ================== MAIN X100 LUCK UI ==================
local ui = Instance.new("ScreenGui", player.PlayerGui)
ui.ResetOnSpawn = false

local frame = Instance.new("Frame", ui)
frame.Size = UDim2.new(0,220,0,120)
frame.Position = UDim2.new(0.5,-110,0.5,-60)
frame.BackgroundColor3 = Color3.fromRGB(20,60,35)
frame.BackgroundTransparency = 0.2
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,16)

local stroke2 = Instance.new("UIStroke", frame)
stroke2.Color = Color3.fromRGB(255,215,0)
stroke2.Thickness = 2

local title2 = Instance.new("TextLabel", frame)
title2.Size = UDim2.new(1,-40,0,30)
title2.Position = UDim2.new(0,10,0,6)
title2.BackgroundTransparency = 1
title2.Text = "🍀 x100 LUCK"
title2.Font = Enum.Font.GothamBlack
title2.TextSize = 18
title2.TextColor3 = Color3.fromRGB(180,255,180)
title2.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0,26,0,26)
close.Position = UDim2.new(1,-32,0,6)
close.Text = "✕"
close.Font = Enum.Font.GothamBlack
close.TextSize = 16
close.TextColor3 = Color3.fromRGB(255,220,120)
close.BackgroundColor3 = Color3.fromRGB(30,80,50)
close.BorderSizePixel = 0
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0,150,0,40)
toggle.Position = UDim2.new(0.5,-75,0,60)
toggle.Text = "ON"
toggle.Font = Enum.Font.GothamBlack
toggle.TextSize = 16
toggle.TextColor3 = Color3.fromRGB(20,60,30)
toggle.BackgroundColor3 = Color3.fromRGB(120,255,140)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

local enabled = false
local fruits = {"Leopard","Dragon","Kitsune","Dough","Venom","Spirit","Control"}

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		toggle.Text = "OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(255,220,120)
		local fruit = fruits[math.random(#fruits)]
		StarterGui:SetCore("SendNotification",{
			Title="🍀 X100 LUCK",
			Text="Bạn đã random ra "..fruit.." — trái xịn nhất game 😎",
			Duration=4
		})
	else
		toggle.Text = "ON"
		toggle.BackgroundColor3 = Color3.fromRGB(120,255,140)
	end
end)

close.MouseButton1Click:Connect(function()
	frame.Visible = false
end)
