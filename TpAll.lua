local main = Instance.new("ScreenGui")
main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White background color
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, -75, 0.5, -25) -- Centered on screen
Frame.Size = UDim2.new(0, 150, 0, 50) -- Box size

local tpButton = Instance.new("TextButton")
tpButton.Name = "tpButton"
tpButton.Parent = Frame
tpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green color for button
tpButton.BorderSizePixel = 0
tpButton.Position = UDim2.new(0, 0, 0, 0)
tpButton.Size = UDim2.new(1, 0, 1, 0) -- Fills the box
tpButton.Font = Enum.Font.SourceSans
tpButton.Text = "TP"
tpButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
tpButton.TextSize = 20

local isTeleporting = false

tpButton.MouseButton1Click:Connect(function()
    if not isTeleporting then
        isTeleporting = true
        while isTeleporting do
            local players = game:GetService("Players"):GetPlayers()
            for _, player in ipairs(players) do
                if player ~= game.Players.LocalPlayer then
                    game.Players.LocalPlayer.Character:MoveTo(player.Character.HumanoidRootPart.Position)
                end
            end
            wait(0.1)
        end
    else
        isTeleporting = false
    end
end)

-- Notification display
game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "[TEST] TP All GUI";
    Text = "BY MOYLLO";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
})
