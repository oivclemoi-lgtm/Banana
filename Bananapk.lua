local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BananaLoading"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Frame góc phải
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 280, 0, 90)
frame.Position = UDim2.new(1, -300, 1, -120)
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- viền vàng

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

-- Icon mèo
local img = Instance.new("ImageLabel", frame)
img.Size = UDim2.new(0, 50, 0, 50)
img.Position = UDim2.new(0, 15, 0.5, -25)
img.BackgroundTransparency = 1
img.Image = "rbxassetid://3926305904" -- icon mèo (Roblox asset phổ biến)

-- Text
local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1, -80, 1, -20)
text.Position = UDim2.new(0, 75, 0, 10)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.fromRGB(255, 215, 0) -- chữ vàng
text.Font = Enum.Font.GothamBold
text.TextScaled = true
text.TextXAlignment = Enum.TextXAlignment.Left
text.Text = "Checking..."

-- Fake loading
task.wait(2)
text.Text = "Scanning files..."
task.wait(2)
text.Text = "Almost done..."
task.wait(2)

-- Ban giả
player:Kick("Có con cặc, tham ít thôi cuu 🗿")
