-- Banana Simple Toggle UI
-- Content: x36luck🍀

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Xóa UI cũ nếu có
if PlayerGui:FindFirstChild("BananaToggleUI") then
    PlayerGui.BananaToggleUI:Destroy()
end

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "BananaToggleUI"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.fromScale(0.35, 0.2)
frame.Position = UDim2.fromScale(0.325, 0.4)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Visible = true

-- Bo góc
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 20)

-- Title
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.fromScale(1, 0.4)
title.BackgroundTransparency = 1
title.Text = "🍀 x36luck"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 221, 0)

-- Toggle Button
local toggle = Instance.new("TextButton")
toggle.Parent = frame
toggle.Size = UDim2.fromScale(0.6, 0.35)
toggle.Position = UDim2.fromScale(0.2, 0.5)
toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggle.Text = "ON"
toggle.TextScaled = true
toggle.Font = Enum.Font.GothamBold
toggle.TextColor3 = Color3.fromRGB(0, 255, 0)
toggle.BorderSizePixel = 0

local toggleCorner = Instance.new("UICorner", toggle)
toggleCorner.CornerRadius = UDim.new(0, 15)

-- Trạng thái
local enabled = true

toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        toggle.Text = "ON"
        toggle.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        toggle.Text = "OFF"
        toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

-- Nút thu gọn (ẩn / hiện menu)
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        frame.Visible = not frame.Visible
    end
end)
