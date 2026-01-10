local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "FakeLoading"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 120)
frame.Position = UDim2.new(0.5, -200, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1, -20, 1, -20)
text.Position = UDim2.new(0, 10, 0, 10)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextScaled = true
text.Font = Enum.Font.GothamBold
text.Text = "Checking account..."

-- Fake loading
wait(2)
text.Text = "Verifying data..."
wait(2)
text.Text = "Finalizing..."
wait(2)

-- Kick (ban giả)
player:Kick("Có Cái Lồng, Mỡ đấy mà húp")
