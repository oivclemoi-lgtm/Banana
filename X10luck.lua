-- FAKE x10 LUCK BOOSTER UI - Mobile Touch + EPIC SOUNDS 😈💰
-- By Grok for chéo (Vinh, 31/1/2026)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local gui = Instance.new("ScreenGui")
gui.Name = "X10LuckGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

-- Main Menu Frame (ẩn đầu)
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0.45, 0, 0.55, 0)
frame.Position = UDim2.new(0.275, 0, 0.225, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 20)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(255, 100, 0)
frameStroke.Thickness = 3
frameStroke.Parent = frame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.18, 0)
title.BackgroundTransparency = 1
title.Text = "x10 LUCK BOOSTER 🔥"
title.TextColor3 = Color3.fromRGB(255, 200, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = frame

local titleStroke = Instance.new("UIStroke")
titleStroke.Color = Color3.fromRGB(255, 255, 0)
titleStroke.Thickness = 2
titleStroke.Parent = title

-- Luck Display Label
local luckLabel = Instance.new("TextLabel")
luckLabel.Name = "LuckDisplay"
luckLabel.Size = UDim2.new(0.92, 0, 0.35, 0)
luckLabel.Position = UDim2.new(0.04, 0, 0.22, 0)
luckLabel.BackgroundTransparency = 1
luckLabel.Text = "x1 Luck (Normal 😴)"
luckLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
luckLabel.TextScaled = true
luckLabel.Font = Enum.Font.Arcade
luckLabel.Parent = frame

local luckStroke = Instance.new("UIStroke")
luckStroke.Color = Color3.new(1,1,1)
luckStroke.Thickness = 1.5
luckStroke.Parent = luckLabel

-- Fake Timer
local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0.9, 0, 0.12, 0)
timerLabel.Position = UDim2.new(0.05, 0, 0.6, 0)
timerLabel.BackgroundTransparency = 1
timerLabel.Text = "Duration: --:--"
timerLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.GothamBold
timerLabel.Parent = frame

-- Activate Button
local activateBtn = Instance.new("TextButton")
activateBtn.Size = UDim2.new(0.85, 0, 0.18, 0)
activateBtn.Position = UDim2.new(0.075, 0, 0.75, 0)
activateBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
activateBtn.Text = "ACTIVATE x10 LUCK 🔥"
activateBtn.TextColor3 = Color3.new(1,1,1)
activateBtn.TextScaled = true
activateBtn.Font = Enum.Font.GothamBlack
activateBtn.Parent = frame

local actCorner = Instance.new("UICorner")
actCorner.CornerRadius = UDim.new(0, 15)
actCorner.Parent = activateBtn

local actStroke = Instance.new("UIStroke")
actStroke.Color = Color3.fromRGB(255, 200, 0)
actStroke.Thickness = 2
actStroke.Parent = activateBtn

-- Deactivate Button (nhỏ hơn)
local deactBtn = Instance.new("TextButton")
deactBtn.Size = UDim2.new(0.4, 0, 0.12, 0)
deactBtn.Position = UDim2.new(0.05, 0, 0.95, 0)
deactBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
deactBtn.Text = "OFF ❌"
deactBtn.TextColor3 = Color3.new(1,1,1)
deactBtn.TextScaled = true
deactBtn.Font = Enum.Font.GothamBold
deactBtn.Parent = frame

local deactCorner = Instance.new("UICorner")
deactCorner.CornerRadius = UDim.new(0, 10)
deactCorner.Parent = deactBtn

-- Floating Toggle Button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleBtn"
toggleBtn.Size = UDim2.new(0, 80, 0, 80)
toggleBtn.Position = UDim2.new(0.90, -20, 0.88, -20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
toggleBtn.Text = "😈"
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBlack
toggleBtn.Parent = gui

local togCorner = Instance.new("UICorner")
togCorner.CornerRadius = UDim.new(1, 0)
togCorner.Parent = toggleBtn

-- Variables
local isActive = false
local tweenService = game:GetService("TweenService")
local soundService = game:GetService("SoundService")

-- Sound IDs EPIC (working 2026)
local sounds = {
    "rbxassetid://131961136",  -- Coins jackpot 💰
    "rbxassetid://138081500",  -- Success ding 🔔
    "rbxassetid://599704789"   -- Triumph fanfare 🎉
}

local timerConnection

-- Play EPIC Sounds
local function playEpicSounds()
    for _, id in pairs(sounds) do
        local sound = Instance.new("Sound")
        sound.SoundId = id
        sound.Volume = 0.7
        sound.Parent = gui
        sound:Play()
        game.Debris:AddItem(sound, 5)
    end
end

-- Activate Effect
local function activateLuck()
    isActive = true
    luckLabel.Text = "x10 LUCK BOOST ACTIVE! 💰🔥"
    luckLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    luckStroke.Color = Color3.fromRGB(255, 100, 0)
    
    -- Shake + Bounce
    local shakeInfo = TweenInfo.new(0.08, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 8, true)
    tweenService:Create(luckLabel, shakeInfo, {Rotation = 8, Position = UDim2.new(0.04, math.random(-5,5), 0.
