local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "Banana_Fullscreen_Jumpscare"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- ===== LOADING NHANH =====
local loadFrame = Instance.new("Frame", gui)
loadFrame.Size = UDim2.fromScale(0.5, 0.2)
loadFrame.Position = UDim2.fromScale(0.25, 0.4)
loadFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
loadFrame.BackgroundTransparency = 0.15
loadFrame.BorderSizePixel = 0
Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0,18)

local loadText = Instance.new("TextLabel", loadFrame)
loadText.Size = UDim2.fromScale(1,0.4)
loadText.BackgroundTransparency = 1
loadText.Text = "Loading..."
loadText.Font = Enum.Font.GothamBold
loadText.TextScaled = true
loadText.TextColor3 = Color3.fromRGB(0,255,120)

local barBG = Instance.new("Frame", loadFrame)
barBG.Size = UDim2.fromScale(0.9,0.25)
barBG.Position = UDim2.fromScale(0.05,0.6)
barBG.BackgroundColor3 = Color3.fromRGB(40,40,40)
barBG.BorderSizePixel = 0
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(0,255,120)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

TweenService:Create(bar, TweenInfo.new(1.5), {
	Size = UDim2.fromScale(1,1)
}):Play()

task.wait(1.7)

-- ===== FULL SCREEN JUMPSCARE =====
loadFrame.Visible = false

local img = Instance.new("ImageLabel", gui)
img.Size = UDim2.new(1,0,1,0)
img.Position = UDim2.new(0,0,0,0)
img.BackgroundTransparency = 1
img.ZIndex = 999
img.Visible = true

-- 2 ẢNH NHẤP NHÁY
local image1 = "rbxassetid://136251622862540"
local image2 = "rbxassetid://86091233733061"

-- SOUND
local sound = Instance.new("Sound", gui)
sound.SoundId = "rbxassetid://4699831936"
sound.Volume = 6
sound:Play()

-- NHÁY LIÊN TỤC
for i = 1, 20 do
	img.Image = image1
	task.wait(0.07)
	img.Image = image2
	task.wait(0.07)
end

img.Image = image2

-- ĐỢI RỒI KICK
task.wait(10)
player:Kick("hì hì^^")
