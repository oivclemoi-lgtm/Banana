-- Banana Premium Fake Loading + Kick
-- Made by Phongcuto 🍌

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Tạo ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "BananaLoading"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Khung chính (giữa màn hình)
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 420, 0, 220)
frame.Position = UDim2.new(0.5, -210, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Bo góc
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 20)

-- Viền vàng
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 215, 0)
stroke.Thickness = 2

-- Tiêu đề
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "🍌 Banana Premium"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 22

-- Chú thích
local desc = Instance.new("TextLabel")
desc.Parent = frame
desc.Size = UDim2.new(1, -40, 0, 60)
desc.Position = UDim2.new(0, 20, 0, 55)
desc.BackgroundTransparency = 1
desc.TextWrapped = true
desc.TextYAlignment = Enum.TextYAlignment.Top
desc.Text = "Cảm ơn bạn đã đến với script của Phongcuto.\nChúc bạn sử dụng script vui vẻ!\nLưu ý: Banana Free Premium – đầy đủ chức năng."
desc.TextColor3 = Color3.fromRGB(220, 220, 220)
desc.Font = Enum.Font.Gotham
desc.TextSize = 14

-- Thanh load nền
local barBg = Instance.new("Frame")
barBg.Parent = frame
barBg.Size = UDim2.new(1, -40, 0, 18)
barBg.Position = UDim2.new(0, 20, 1, -50)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BorderSizePixel = 0

local barCorner = Instance.new("UICorner", barBg)
barCorner.CornerRadius = UDim.new(1, 0)

-- Thanh load chạy
local bar = Instance.new("Frame")
bar.Parent = barBg
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
bar.BorderSizePixel = 0

local barCorner2 = Instance.new("UICorner", bar)
barCorner2.CornerRadius = UDim.new(1, 0)

-- % load
local percent = Instance.new("TextLabel")
percent.Parent = frame
percent.Size = UDim2.new(1, -40, 0, 20)
percent.Position = UDim2.new(0, 20, 1, -75)
percent.BackgroundTransparency = 1
percent.Text = "Loading... 0%"
percent.TextColor3 = Color3.fromRGB(255, 255, 255)
percent.Font = Enum.Font.Gotham
percent.TextSize = 14

-- Chạy loading 10s
for i = 1, 100 do
	bar.Size = UDim2.new(i / 100, 0, 1, 0)
	percent.Text = "Loading... " .. i .. "%"
	task.wait(0.1)
end

task.wait(0.5)

-- Kick giống Roblox thật (Error 267)
player:Kick(
	"You have been permanently banned.\n(Error Code: 267)"
)
