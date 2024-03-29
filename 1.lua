-- Définir le service de l'interface utilisateur
local playerService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")

-- Créer une fonction pour afficher ou cacher le menu des joueurs
local playerMenu = nil

local function togglePlayerMenu()
    if playerMenu then
        playerMenu:Destroy()
        playerMenu = nil
    else
        playerMenu = Instance.new("Frame")
        playerMenu.Name = "PlayerMenu"
        playerMenu.Size = UDim2.new(0, 200, 0, 300)
        playerMenu.Position = UDim2.new(0.5, -100, 0.5, -150)
        playerMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        playerMenu.BackgroundTransparency = 0.5
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
            playerMenu = nil
        end)
        closeButton.Parent = playerMenu

        -- Afficher le menu des joueurs dans l'interface utilisateur
        playerMenu.Parent = game.Players.LocalPlayer.PlayerGui
    end
end

-- Attacher la fonction togglePlayerMenu au clic au milieu de l'écran
userInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        togglePlayerMenu()
    end
end)
