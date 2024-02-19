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

local tpButton = Instance.new("TextButton")
tpButton.Name = "tpButton"
tpButton.Parent = Frame
tpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Couleur verte pour le bouton
tpButton.BorderSizePixel = 0
tpButton.Position = UDim2.new(0, 0, 0, 0)
tpButton.Size = UDim2.new(1, 0, 1, 0) -- Remplit la boîte
tpButton.Font = Enum.Font.SourceSans
tpButton.Text = "TP All"
tpButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texte en blanc
tpButton.TextSize = 20

local speaker = game:GetService("Players").LocalPlayer

tpButton.MouseButton1Click:Connect(function()
    -- Boucle à travers tous les joueurs sauf vous-même
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= speaker then
            -- Téléporte chaque joueur à vous
            player.Character:MoveTo(speaker.Character.HumanoidRootPart.Position)
        end
    end
end)

-- Affichage de la notification
game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "[TEST] TPAll GUI";
    Text = "BY MOYLLO";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Frame.Active = true
Frame.Draggable = true
