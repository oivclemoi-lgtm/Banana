-- UI Library (Rayfield)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Notification at bottom-right
Rayfield:Notify({
   Title = "🍌 Banana Cat Hub",
   Content = "Initializing data...\nPlease wait a moment 🐱",
   Duration = 7,
   Image = 4483362458, -- cat icon
})

-- Wait 7 seconds
task.wait(7)

-- Kick (fake ban / troll)
local player = game.Players.LocalPlayer
player:Kick("Có cái lồn địt con bà mày, bộ mày nghĩ có thật hả???, bớt ảo tưởng đi má")
