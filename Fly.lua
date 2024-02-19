local main = Instance.new("ScreenGui")
main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Couleur de fond blanche
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, -75, 0.5, -25) -- Positionné au centre de l'écran
Frame.Size = UDim2.new(0, 150, 0, 50) -- Taille de la boîte
Frame.Active = true -- Rend le cadre actif pour pouvoir le glisser
Frame.Draggable = true -- Permet le glisser-déposer

local flyButton = Instance.new("TextButton")
flyButton.Name = "flyButton"
flyButton.Parent = Frame
flyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Couleur verte pour le bouton
flyButton.BorderSizePixel = 0
flyButton.Position = UDim2.new(0, 0, 0, 0)
flyButton.Size = UDim2.new(1, 0, 1, 0) -- Remplit la boîte
flyButton.Font = Enum.Font.SourceSans
flyButton.Text = "Fly"
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texte en blanc
flyButton.TextSize = 20

local nowe = false
local speeds = 1
local speaker = game:GetService("Players").LocalPlayer

flyButton.MouseButton1Click:Connect(function()
    if nowe == true then
        nowe = false
        -- Désactive le vol
    else
        nowe = true
        -- Active le vol
    end
end)

-- Affichage de la notification
game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "[TEST] Fly GUI";
    Text = "BY MOYLLO";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
