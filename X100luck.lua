--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

--// LOADING UI
local loadGui = Instance.new("ScreenGui", player.PlayerGui)
loadGui.IgnoreGuiInset = true

local loadFrame = Instance.new("Frame", loadGui)
loadFrame.Size = UDim2.new(0, 420, 0, 180)
loadFrame.Position = UDim2.new(0.5, -210, 0.5, -90)
loadFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
loadFrame.BackgroundTransparency = 0.1
loadFrame.Active = true
loadFrame.Draggable = true
Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0,20)

local title = Instance.new("TextLabel", loadFrame)
title.Size = UDim2.new(1,0,0,60)
title.BackgroundTransparency = 1
title.Text = "Chào Mừng Bạn Đến Với Script x100Luck Của PhongCuto\nCHÚC MAY MẮN 🍀🍀🍀"
title.TextColor3 = Color3.fromRGB(120,255,140)
title.Font = Enum.Font.GothamBold
title.TextWrapped = true
title.TextScaled = true

local percent = Instance.new("TextLabel", loadFrame)
percent.Position = UDim2.new(0,0,0.55,0)
percent.Size = UDim2.new(1,0,0,30)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.Font = Enum.Font.GothamBold
percent.TextScaled = true
percent.TextColor3 = Color3.fromRGB(255,255,255)

local barBg = Instance.new("Frame", loadFrame)
barBg.Position = UDim2.new(0.1,0,0.78,0)
barBg.Size = UDim2.new(0.8,0,0,10)
barBg.BackgroundColor3 = Color3.fromRGB(40,40,40)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(120,255,140)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar).CornerRadius = UDim.new(1,0)

-- Loading chạy
for i = 1,100 do
	percent.Text = i.."%"
	bar.Size = UDim2.new(i/100,0,1,0)
	task.wait(0.03)
end

task.wait(0.5)
loadGui:Destroy()

--// MAIN UI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,260,0,170)
frame.Position = UDim2.new(0.05,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(20,25,20)
frame.BackgroundTransparency = 0.15
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,215,100)
stroke.Thickness = 2

local header = Instance.new("TextLabel", frame)
header.Size = UDim2.new(1,-40,0,40)
header.Position = UDim2.new(0,10,0,0)
header.BackgroundTransparency = 1
header.Text = "🍀 x100 LUCK"
header.Font = Enum.Font.GothamBold
header.TextColor3 = Color3.fromRGB(120,255,140)
header.TextScaled = true

-- Close button
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,5)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

-- Mini button
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.new(0,50,0,50)
mini.Position = UDim2.new(0.02,0,0.5,0)
mini.Text = "🍀"
mini.TextScaled = true
mini.Visible = false
mini.BackgroundColor3 = Color3.fromRGB(30,80,30)
Instance.new("UICorner", mini).CornerRadius = UDim.new(1,0)

close.MouseButton1Click:Connect(function()
	frame.Visible = false
	mini.Visible = true
end)

mini.MouseButton1Click:Connect(function()
	frame.Visible = true
	mini.Visible = false
end)

-- Luck text
local luckText = Instance.new("TextLabel", frame)
luckText.Position = UDim2.new(0,0,0,55)
luckText.Size = UDim2.new(1,0,0,30)
luckText.BackgroundTransparency = 1
luckText.Text = "Luck: 0%"
luckText.Font = Enum.Font.GothamBold
luckText.TextScaled = true
luckText.TextColor3 = Color3.fromRGB(255,255,255)

-- Luck bar
local luckBg = Instance.new("Frame", frame)
luckBg.Position = UDim2.new(0.15,0,0,95)
luckBg.Size = UDim2.new(0.7,0,0,8)
luckBg.BackgroundColor3 = Color3.fromRGB(40,40,40)
luckBg.BorderSizePixel = 0
Instance.new("UICorner", luckBg).CornerRadius = UDim.new(1,0)

local luckBar = Instance.new("Frame", luckBg)
luckBar.Size = UDim2.new(0,0,1,0)
luckBar.BackgroundColor3 = Color3.fromRGB(120,255,140)
luckBar.BorderSizePixel = 0
Instance.new("UICorner", luckBar).CornerRadius = UDim.new(1,0)

-- ON/OFF
local toggle = Instance.new("TextButton", frame)
toggle.Position = UDim2.new(0.2,0,0,120)
toggle.Size = UDim2.new(0.6,0,0,35)
toggle.Text = "OFF"
toggle.Font = Enum.Font.GothamBold
toggle.TextScaled = true
toggle.BackgroundColor3 = Color3.fromRGB(150,60,60)
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,14)

-- Logic
local running = false
local luckValue = 0

toggle.MouseButton1Click:Connect(function()
	running = not running
	if running then
		toggle.Text = "ON"
		toggle.BackgroundColor3 = Color3.fromRGB(60,180,90)

		task.spawn(function()
			while running do
				luckValue = math.random(1,100)
				luckText.Text = "Luck: "..luckValue.."%"
				luckBar.Size = UDim2.new(luckValue/100,0,1,0)

				if luckValue >= 70 then
					luckText.TextColor3 = Color3.fromRGB(120,255,140)
				else
					luckText.TextColor3 = Color3.fromRGB(255,255,255)
				end

				if luckValue == 100 then
					StarterGui:SetCore("SendNotification",{
						Title = "🍀 SYSTEM",
						Text = "Bạn đã random ra trái xịn nhất game 😈",
						Duration = 4
					})
				end
				task.wait(0.8)
			end
		end)
	else
		toggle.Text = "OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(150,60,60)
		luckText.Text = "Luck: 0%"
		luckBar.Size = UDim2.new(0,0,1,0)
	end
end)
