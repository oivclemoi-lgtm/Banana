local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "BananaDarkLoading"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Overlay đen toàn màn hình
local overlay = Instance.new("Frame", gui)
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.2
overlay.BorderSizePixel = 0

-- Khung chính giữa
local frame = Instance.new("Frame", overlay)
frame.Size = UDim2.new(0, 420, 0, 160)
frame.Position = UDim2.new(0.5, -210, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 215, 0)

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 16)

-- Viền glow
local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 215, 0)
stroke.Transparency = 0.1

-- Icon mèo
local img = Instance.new("ImageLabel", frame)
img.Size = UDim2.new(0, 60, 0, 60)
img.Position = UDim2.new(0, 20, 0.5, -30)
img.BackgroundTransparency = 1
img.Image = "rbxassetid://3926305904"

-- Text loading
local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1, -110, 0, 40)
text.Position = UDim2.new(0, 100, 0, 30)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.fromRGB(255, 215, 0)
text.Font = Enum.Font.GothamBold
text.TextScaled = true
text.TextXAlignment = Enum.TextXAlignment.Left
text.Text = "Loading... 0%"

-- Thanh loading nền
local barBg = Instance.new("Frame", frame)
barBg.Size = UDim2.new(1, -40, 0, 12)
barBg.Position = UDim2.new(0, 20, 1, -35)
barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
barBg.BorderSizePixel = 0

local barCorner = Instance.new("UICorner", barBg)
barCorner.CornerRadius = UDim.new(0, 8)

-- Thanh chạy
local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
bar.BorderSizePixel = 0

local barCorner2 = Instance.new("UICorner", bar)
barCorner2.CornerRadius = UDim.new(0, 8)

-- Fake loading 0 -> 100%
for i = 0, 100 do
    text.Text = "Loading... " .. i .. "%"
    bar.Size = UDim2.new(i / 100, 0, 1, 0)
    task.wait(0.05) -- chỉnh nhanh/chậm tại đây
end

task.wait(0.4)

-- Kick (câu tiếng Anh đầu tiên)
player:Kick("You have been kicked from this experience.\nReason: Suspected cheating.")
