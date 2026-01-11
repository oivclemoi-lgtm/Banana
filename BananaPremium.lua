-- Banana Premium Upgrade: Loading -> Jumpscare -> Kick
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

-- ===== LOADING UI =====
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,420,0,220)
frame.Position = UDim2.new(0.5,-210,0.5,-110)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,20)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,215,0)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,-20,0,40)
title.Position = UDim2.new(0,10,0,10)
title.BackgroundTransparency = 1
title.Text = "🍌 Banana Premium"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255,215,0)

local desc = Instance.new("TextLabel", frame)
desc.Size = UDim2.new(1,-40,0,60)
desc.Position = UDim2.new(0,20,0,55)
desc.BackgroundTransparency = 1
desc.TextWrapped = true
desc.TextYAlignment = Enum.TextYAlignment.Top
desc.Text = "Cảm ơn bạn đã đến với script của Phongcuto.\nVui lòng chờ trong giây lát..."
desc.Font = Enum.Font.Gotham
desc.TextSize = 14
desc.TextColor3 = Color3.fromRGB(220,220,220)

local barBg = Instance.new("Frame", frame)
barBg.Size = UDim2.new(1,-40,0,18)
barBg.Position = UDim2.new(0,20,1,-50)
barBg.BackgroundColor3 = Color3.fromRGB(40,40,40)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(255,215,0)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

local percent = Instance.new("TextLabel", frame)
percent.Size = UDim2.new(1,-40,0,20)
percent.Position = UDim2.new(0,20,1,-75)
percent.BackgroundTransparency = 1
percent.Text = "Loading... 0%"
percent.Font = Enum.Font.Gotham
percent.TextSize = 14
percent.TextColor3 = Color3.fromRGB(255,255,255)

-- Loading chạy
for i = 1,100 do
	bar.Size = UDim2.new(i/100,0,1,0)
	percent.Text = "Loading... "..i.."%"
	task.wait(0.08)
end

-- ===== JUMPSCARE =====
frame:Destroy()

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.new(0,0,0)

local img = Instance.new("ImageLabel", bg)
img.Size = UDim2.new(1,0,1,0)
img.BackgroundTransparency = 1
img.Image = "rbxassetid://10818442231" -- mặt hù

local sound = Instance.new("Sound", SoundService)
sound.SoundId = "rbxassetid://138186576" -- scream
sound.Volume = 10
sound:Play()

-- Rung mạnh
for i = 1,20 do
	img.Position = UDim2.new(0, math.random(-40,40), 0, math.random(-40,40))
	task.wait(0.03)
end

-- ===== KICK =====
task.wait(1.5)
player:Kick("You have been permanently banned.\n(Error Code: 267)")
