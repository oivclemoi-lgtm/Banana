-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "BananaLoading"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Dark background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0

-- Loading box
local box = Instance.new("Frame", bg)
box.Size = UDim2.new(0, 400, 0, 180)
box.Position = UDim2.new(0.5, -200, 0.5, -90)
box.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
box.BorderColor3 = Color3.fromRGB(255, 215, 0)
box.BorderSizePixel = 2

-- Title
local title = Instance.new("TextLabel", box)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "🍌 Banana Cat Hub"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 22

-- Loading bar background
local barBg = Instance.new("Frame", box)
barBg.Size = UDim2.new(0, 360, 0, 18)
barBg.Position = UDim2.new(0.5, -180, 0, 70)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BorderSizePixel = 0

-- Loading bar
local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
bar.BorderSizePixel = 0

-- Percent text
local percent = Instance.new("TextLabel", box)
percent.Size = UDim2.new(1, 0, 0, 30)
percent.Position = UDim2.new(0, 0, 0, 95)
percent.BackgroundTransparency = 1
percent.Text = "Loading... 0%"
percent.TextColor3 = Color3.fromRGB(255, 255, 255)
percent.Font = Enum.Font.Gotham
percent.TextSize = 16

-- Note / caption
local note = Instance.new("TextLabel", box)
note.Size = UDim2.new(1, -20, 0, 50)
note.Position = UDim2.new(0, 10, 1, -55)
note.BackgroundTransparency = 1
note.TextWrapped = true
note.Text = "Cảm ơn bạn đã đến với script của Phongcuto.\nChúc bạn sử dụng script vui vẻ!\nLưu ý: Đây là Banana Free Premium đầy đủ chức năng."
note.TextColor3 = Color3.fromRGB(200, 200, 200)
note.Font = Enum.Font.Gotham
note.TextSize = 13

-- Loading animation (10 seconds)
local totalTime = 10
for i = 0, 100 do
	bar.Size = UDim2.new(i/100, 0, 1, 0)
	percent.Text = "Loading... "..i.."%"
	task.wait(totalTime / 100)
end

-- Small delay
task.wait(0.5)

-- Kick with Roblox-like ban reason
player:Kick(
	"You have been permanently banned from this experience.\n(Error Code: 267)"
)
