pcall(function()

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "BananaPremiumGUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = PlayerGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.fromScale(0.45, 0.22)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.35
frame.ZIndex = 999

-- Corner
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,22)

-- Border vàng
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(255,215,0)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Banana Premium"
title.TextColor3 = Color3.fromRGB(255,230,120)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.ZIndex = 1000

-- Subtitle
local sub = Instance.new("TextLabel", frame)
sub.Size = UDim2.new(1, -20, 0, 30)
sub.Position = UDim2.new(0, 10, 0, 55)
sub.BackgroundTransparency = 1
sub.Text = "Đang xác minh bảo mật..."
sub.TextColor3 = Color3.fromRGB(200,255,200)
sub.Font = Enum.Font.Gotham
sub.TextScaled = true
sub.ZIndex = 1000

-- Loading bar bg
local barBg = Instance.new("Frame", frame)
barBg.Size = UDim2.new(1, -40, 0, 18)
barBg.Position = UDim2.new(0, 20, 1, -40)
barBg.BackgroundColor3 = Color3.fromRGB(40,40,40)
barBg.BorderSizePixel = 0
barBg.ZIndex = 1000
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)

-- Bar
local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(255,215,0)
bar.BorderSizePixel = 0
bar.ZIndex = 1001
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

-- Percent
local percent = Instance.new("TextLabel", frame)
percent.Size = UDim2.new(1,0,0,28)
percent.Position = UDim2.new(0,0,1,-70)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(255,255,255)
percent.Font = Enum.Font.GothamBold
percent.TextScaled = true
percent.ZIndex = 1000

-- Sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://17711826189"
sound.Volume = 8
sound.Looped = true
sound.Parent = SoundService
sound:Play()

-- Loading
for i = 1,100 do
	bar.Size = UDim2.new(i/100,0,1,0)
	percent.Text = i.."%"
	task.wait(0.03)
end

sound:Stop()

player:Kick([[
Bạn đã bị cấm vĩnh viễn khỏi trải nghiệm này.

Lý do:
Hành vi vi phạm Điều khoản Sử dụng của Roblox.

Nếu bạn cho rằng đây là nhầm lẫn,
vui lòng truy cập roblox.com/support.

Mã lỗi: 267
]])

end)
