-- Définir le service de l'interface utilisateur
local playerService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")

-- Créer une fonction pour afficher le menu des joueurs
local function showPlayerMenu()
    -- Créer un cadre pour le menu des joueurs
    local playerMenu = Instance.new("Frame")
    playerMenu.Name = "PlayerMenu"
    playerMenu.Size = UDim2.new(0, 100, 0, 100)
    playerMenu.Position = UDim2.new(0.5, -50, 0.5, -50)
    playerMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    playerMenu.BorderSizePixel = 2
    playerMenu.BorderColor3 = Color3.fromRGB(255, 255, 255)
    
    -- Attacher le mouvement de la souris pour déplacer le menu
    local isDragging = false
    local offset = Vector2.new(0, 0)
    
    playerMenu.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = true
            offset = playerMenu.Position - UDim2.new(0, input.Position.X, 0, input.Position.Y)
        end
    end)
    
    userInputService.InputChanged:Connect(function(input)
        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local newPosition = UDim2.new(0, input.Position.X, 0, input.Position.Y) + offset
            playerMenu.Position = newPosition
        end
    end)
    
    userInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDragging = false
        end
    end)
    
    -- Créer un bouton pour fermer le menu
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -25, 0, 5)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextSize = 14
    closeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    closeButton.BorderSizePixel = 0
    closeButton.MouseButton1Click:Connect(function()
        playerMenu:Destroy()
    end)
    closeButton.Parent = playerMenu
    
    -- Afficher le menu des joueurs dans l'interface utilisateur
    playerMenu.Parent = game.Players.LocalPlayer.PlayerGui
end

-- Attacher la fonction showPlayerMenu au clic au milieu de l'écran
userInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        showPlayerMenu()
    end
end)
