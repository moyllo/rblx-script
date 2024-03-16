-- Définir le service de l'interface utilisateur
local playerService = game:GetService("Players")
local guiService = game:GetService("GuiService")

-- Créer une fonction pour afficher le menu des joueurs
local function showPlayerMenu()
    -- Créer un cadre pour le menu des joueurs
    local playerMenu = Instance.new("Frame")
    playerMenu.Name = "PlayerMenu"
    playerMenu.Size = UDim2.new(0.3, 0, 0.5, 0)
    playerMenu.Position = UDim2.new(0.35, 0, 0.25, 0)
    playerMenu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    playerMenu.BorderSizePixel = 2
    playerMenu.BorderColor3 = Color3.fromRGB(0, 0, 0)
    
    -- Créer un bouton pour fermer le menu
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    closeButton.TextSize = 20
    closeButton.BackgroundTransparency = 1
    closeButton.MouseButton1Click:Connect(function()
        playerMenu:Destroy()
    end)
    closeButton.Parent = playerMenu
    
    -- Afficher les noms des joueurs dans le menu
    local yOffset = 40
    for _, player in ipairs(playerService:GetPlayers()) do
        local playerButton = Instance.new("TextButton")
        playerButton.Size = UDim2.new(0.9, 0, 0, 30)
        playerButton.Position = UDim2.new(0.05, 0, 0, yOffset)
        playerButton.Text = player.Name
        playerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        playerButton.TextSize = 20
        playerButton.BackgroundTransparency = 0.5
        playerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        playerButton.MouseButton1Click:Connect(function()
            -- Téléporter le joueur au joueur sélectionné
            local character = player.Character
            if character then
                local targetCharacter = player.Character
                if targetCharacter then
                    character:MoveTo(targetCharacter.HumanoidRootPart.Position)
                end
            end
        end)
        playerButton.Parent = playerMenu
        yOffset = yOffset + 35
    end
    
    -- Afficher le menu des joueurs dans l'interface utilisateur
    playerMenu.Parent = game.Players.LocalPlayer.PlayerGui
end

-- Attacher la fonction showPlayerMenu au clic au milieu de l'écran
guiService.MiddleMouseButtonClick:Connect(function()
    showPlayerMenu()
end)
