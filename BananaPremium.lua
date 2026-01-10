local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "BananaLoadingPercent"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Frame góc phải dưới
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 260, 0, 80)
frame.Position = UDim2.new(1, -280, 1, -120)
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- viền vàng

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Icon mèo
local img = Instance.new("ImageLabel")
img.Parent = frame
img.Size = UDim2.new(0, 40, 0, 40)
img.Position = UDim2.new(0, 12, 0.5, -20)
img.BackgroundTransparency = 1
img.Image = "rbxassetid://3926305904"

-- Text loading %
local text = Instance.new("TextLabel")
text.Parent = frame
text.Size = UDim2.new(1, -70, 1, 0)
text.Position = UDim2.new(0, 60, 0, 0)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.fromRGB(255, 215, 0)
text.Font = Enum.Font.GothamBold
text.TextScaled = true
text.TextXAlignment = Enum.TextXAlignment.Left
text.Text = "Loading... 0%"

-- Fake loading chạy số %
for i = 0, 100 do
    text.Text = "Loading... " .. i .. "%"
    task.wait(0.06) -- chỉnh nhanh/chậm tại đây
end

task.wait(0.3)

-- Kick (1 dòng tiếng Việt)
player:Kick("BỚT ẢO TƯỞNG ĐI BAR")
