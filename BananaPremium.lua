local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- ================= ROOT GUI =================
local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- ================= LOADING (SYSTEM STYLE) =================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.52, 0.26)
frame.Position = UDim2.fromScale(0.24, 0.37)
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.BackgroundTransparency = 0.35
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,26)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,220,0)
stroke.Thickness = 3

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1,0.28)
title.BackgroundTransparency = 1
title.Text = "Roblox Security"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,220,0)

local desc = Instance.new("TextLabel", frame)
desc.Position = UDim2.fromScale(0,0.28)
desc.Size = UDim2.fromScale(1,0.24)
desc.BackgroundTransparency = 1
desc.Text = "Đang xác minh môi trường chạy..."
desc.Font = Enum.Font.Gotham
desc.TextScaled = true
desc.TextColor3 = Color3.new(1,1,1)

local percent = Instance.new("TextLabel", frame)
percent.Position = UDim2.fromScale(0,0.52)
percent.Size = UDim2.fromScale(1,0.14)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.GothamBold
percent.TextScaled = true
percent.TextColor3 = Color3.new(1,1,1)

local barBG = Instance.new("Frame", frame)
barBG.Position = UDim2.fromScale(0.1,0.72)
barBG.Size = UDim2.fromScale(0.8,0.12)
barBG.BackgroundColor3 = Color3.fromRGB(35,35,35)
barBG.BorderSizePixel = 0
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.fromScale(0,1)
bar.BackgroundColor3 = Color3.fromRGB(255,220,0)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

for i=1,100 do
    percent.Text = i.."%"
    TweenService:Create(bar, TweenInfo.new(0.022), {Size = UDim2.fromScale(i/100,1)}):Play()
    task.wait(0.022)
end
frame:Destroy()

-- ================= FAKE ANTI-CHEAT LOG =================
local log = Instance.new("TextLabel", gui)
log.Size = UDim2.fromScale(1,1)
log.BackgroundColor3 = Color3.new(0,0,0)
log.TextColor3 = Color3.fromRGB(0,255,0)
log.Font = Enum.Font.Code
log.TextWrapped = true
log.TextXAlignment = Left
log.TextYAlignment = Top
log.TextSize = 18
log.Text = ""

local logs = {
 "[Roblox Anti-Cheat] Initializing modules...",
 "[Roblox Anti-Cheat] Checking memory regions...",
 "[Roblox Anti-Cheat] Validating client integrity...",
 "[Roblox Anti-Cheat] Suspicious behavior detected.",
 "[Roblox Anti-Cheat] Reporting to moderation service..."
}
for _,v in ipairs(logs) do
    log.Text ..= v.."\n"
    task.wait(0.55)
end
task.wait(0.8)
log:Destroy()

-- ================= FAKE RECONNECT =================
local reconn = Instance.new("TextLabel", gui)
reconn.Size = UDim2.fromScale(1,1)
reconn.BackgroundColor3 = Color3.new(0,0,0)
reconn.BackgroundTransparency = 0.15
reconn.Font = Enum.Font.GothamBold
reconn.TextColor3 = Color3.new(1,1,1)
reconn.TextScaled = true
reconn.Text = "Đang thử kết nối lại..."
task.wait(2.2)
reconn:Destroy()

-- ================= COUNTDOWN =================
local cd = Instance.new("TextLabel", gui)
cd.Size = UDim2.fromScale(1,1)
cd.BackgroundColor3 = Color3.new(0,0,0)
cd.BackgroundTransparency = 0.2
cd.Font = Enum.Font.GothamBold
cd.TextColor3 = Color3.new(1,0,0)
cd.TextScaled = true
for i=5,1,-1 do
    cd.Text = "Ngắt kết nối trong "..i
    task.wait(1)
end
cd:Destroy()

-- ================= JUMPSCARE =================
local scare = Instance.new("Frame", gui)
scare.Size = UDim2.fromScale(1,1)
scare.BackgroundColor3 = Color3.new(0,0,0)

local img1 = Instance.new("ImageLabel", scare)
img1.Size = UDim2.fromScale(1,1)
img1.BackgroundTransparency = 1
img1.Image = "rbxassetid://136251622862540"

local img2 = Instance.new("ImageLabel", scare)
img2.Size = UDim2.fromScale(1,1)
img2.BackgroundTransparency = 1
img2.Image = "rbxassetid://86091233733061"
img2.Visible = false

task.spawn(function()
    while true do
        img1.Visible = not img1.Visible
        img2.Visible = not img2.Visible
        task.wait(0.055)
    end
end)

RunService.RenderStepped:Connect(function()
    scare.Position = UDim2.fromOffset(math.random(-9,9), math.random(-9,9))
end)

-- ================= SOUND (LOUD + LOOP) =================
local sound = Instance.new("Sound", game.SoundService)
sound.SoundId = "rbxassetid://17711826189"
sound.Volume = 0
sound.Looped = true
sound:Play()
task.spawn(function()
    for v=0,10,0.25 do
        sound.Volume = v
        task.wait(0.12)
    end
end)

-- ================= FINAL FAKE BAN =================
task.wait(10)
player:Kick([[
Tài khoản của bạn đã bị chấm dứt.

Tài khoản này đã bị đình chỉ vĩnh viễn do vi phạm
Điều khoản sử dụng của Roblox.

Lý do:
Sử dụng phần mềm can thiệp trái phép.

Mã lỗi: 267

Quyết định này là vĩnh viễn.
Nếu bạn cho rằng đây là nhầm lẫn,
vui lòng truy cập roblox.com/support.
]])
