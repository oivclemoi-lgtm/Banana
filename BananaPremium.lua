-- 🍌 Banana Premium
-- Fake Ban with Error Code 267
-- Delta Executor | By Hihi Hehe

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local player = Players.LocalPlayer

-- Remove old UI
if game.CoreGui:FindFirstChild("BananaToast") then
    game.CoreGui.BananaToast:Destroy()
end

-- Toast UI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "BananaToast"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 360, 0, 95)
frame.Position = UDim2.new(0, 20, 1, 120)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 28)
title.Position = UDim2.new(0, 10, 0, 8)
title.BackgroundTransparency = 1
title.Text = "Banana Premium UI Library"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255, 221, 0)
title.TextXAlignment = Left

-- Desc
local desc = Instance.new("TextLabel", frame)
desc.Size = UDim2.new(1, -20, 0, 45)
desc.Position = UDim2.new(0, 10, 0, 38)
desc.BackgroundTransparency = 1
desc.TextWrapped = true
desc.TextYAlignment = Top
desc.TextXAlignment = Left
desc.Text = "The UI automatically hides once executed."
desc.Font = Enum.Font.Gotham
desc.TextSize = 13
desc.TextColor3 = Color3.fromRGB(220, 220, 220)

-- Slide in animation
TweenService:Create(
    frame,
    TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    {Position = UDim2.new(0, 20, 1, -120)}
):Play()

-- Loading sound
local loadSound = Instance.new("Sound", SoundService)
loadSound.SoundId = "rbxassetid://9118823101"
loadSound.Volume = 1.5
loadSound:Play()

task.wait(3)

-- Laugh sound 😈
local laugh = Instance.new("Sound", SoundService)
laugh.SoundId = "rbxassetid://912570642"
laugh.Volume = 4
laugh:Play()

task.wait(1.5)

-- Fake ban with Error Code 267
player:Kick(
    "You were kicked from this experience.\n\n" ..
    "Reason: You have been permanently banned for cheating.\n\n" ..
    "Error Code: 267"
)
