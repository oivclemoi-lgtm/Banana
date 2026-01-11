-- Fake Fruit Notifier PRO 🍎 | Visual Only | Delta OK

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local plr = Players.LocalPlayer
local cam = workspace.CurrentCamera

-- GUI
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "FakeFruitNotifierPRO"
gui.ResetOnSpawn = false

-- MAIN
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 160)
frame.Position = UDim2.new(0.5, -160, 0.12, 0)
frame.BackgroundColor3 = Color3.fromRGB(12, 38, 24)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 18)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 215, 0)
stroke.Thickness = 2

-- TITLE
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 36)
title.BackgroundTransparency = 1
title.Text = "🍎 Fruit Notifier"
title.Font = Enum.Font.GothamBlack
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(180,255,180)

-- INFO
local info = Instance.new("TextLabel", frame)
info.Size = UDim2.new(1, -20, 0, 60)
info.Position = UDim2.new(0, 10, 0, 40)
info.BackgroundTransparency = 1
info.TextWrapped = true
info.Text = "No Devil Fruit detected."
info.Font = Enum.Font.Gotham
info.TextSize = 14
info.TextColor3 = Color3.fromRGB(230,230,230)

-- TOGGLE
local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0, 120, 0, 36)
toggle.Position = UDim2.new(0.5, -60, 1, -46)
toggle.Text = "ON"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 15
toggle.TextColor3 = Color3.fromRGB(30,60,30)
toggle.BackgroundColor3 = Color3.fromRGB(120,255,120)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

-- ARROW
local arrow = Instance.new("ImageLabel", gui)
arrow.Size = UDim2.new(0, 64, 0, 64)
arrow.Position = UDim2.new(0.5, -32, 0.8, 0)
arrow.BackgroundTransparency = 1
arrow.Image = "rbxassetid://7072718365"
arrow.Visible = false

-- SOUND (fake notifier)
local ping = Instance.new("Sound", SoundService)
ping.SoundId = "rbxassetid://9118828566"
ping.Volume = 0.6

-- ICON (hide/show)
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 56, 0, 56)
icon.Position = UDim2.new(0, 16, 0.5, -28)
icon.Text = "🍎"
icon.Font = Enum.Font.GothamBlack
icon.TextSize = 24
icon.TextColor3 = Color3.fromRGB(180,255,180)
icon.BackgroundColor3 = Color3.fromRGB(12, 38, 24)
icon.BackgroundTransparency = 0.15
icon.BorderSizePixel = 0
icon.Visible = false
icon.Active = true
icon.Draggable = true
Instance.new("UICorner", icon).CornerRadius = UDim.new(1,0)

local iconStroke = Instance.new("UIStroke", icon)
iconStroke.Color = Color3.fromRGB(255,215,0)
iconStroke.Thickness = 2

-- CLOSE
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -40, 0, 8)
close.Text = "✕"
close.Font = Enum.Font.GothamBlack
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255,220,120)
close.BackgroundColor3 = Color3.fromRGB(20, 60, 35)
close.BorderSizePixel = 0
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

-- FAKE TARGET (moves to look real)
local fakeTarget = Instance.new("Part")
fakeTarget.Anchored = true
fakeTarget.CanCollide = false
fakeTarget.Transparency = 1
fakeTarget.Parent = workspace

-- LOGIC
local enabled = false
local lastPing = 0

local messages = {
	"🍎 A Devil Fruit has spawned nearby.",
	"🍎 A dropped Devil Fruit has been detected.",
}

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	if enabled then
		toggle.Text = "OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(255,220,120)
		arrow.Visible = true
	else
		toggle.Text = "ON"
		toggle.BackgroundColor3 = Color3.fromRGB(120,255,120)
		info.Text = "No Devil Fruit detected."
		arrow.Visible = false
	end
end)

close.MouseButton1Click:Connect(function()
	frame.Visible = false
	icon.Visible = true
end)

icon.MouseButton1Click:Connect(function()
	icon.Visible = false
	frame.Visible = true
end)

RunService.RenderStepped:Connect(function(dt)
	if not enabled or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then return end

	-- move fake target around player
	local root = plr.Character.HumanoidRootPart.Position
	local radius = math.random(200, 900)
	local angle = tick() % (math.pi*2)
	fakeTarget.Position = root + Vector3.new(math.cos(angle)*radius, 0, math.sin(angle)*radius)

	-- arrow rotation
	local dir = (fakeTarget.Position - root).Unit
	local look = cam.CFrame.LookVector
	local ang = math.atan2(look.X * dir.Z - look.Z * dir.X, look.X * dir.X + look.Z * dir.Z)
	arrow.Rotation = math.deg(ang)

	-- color by "distance"
	if radius < 300 then
		arrow.ImageColor3 = Color3.fromRGB(120,255,120)
	elseif radius < 600 then
		arrow.ImageColor3 = Color3.fromRGB(255,220,120)
	else
		arrow.ImageColor3 = Color3.fromRGB(255,140,140)
	end

	-- random notify
	if tick() - lastPing > math.random(6,10) then
		lastPing = tick()
		info.Text = messages[math.random(1,#messages)]
		ping:Play()
	end
end)
