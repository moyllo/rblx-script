print("bon tg");
-- Créer une fonction pour cloner un joueur
local function clonerJoueur(joueur)
    local clone = joueur:Clone() -- Clone le joueur
    clone.Parent = game.Workspace -- Place le clone dans l'espace de travail
    clone.Position = joueur.Position + Vector3.new(5, 0, 0) -- Déplace le clone légèrement
end

-- Événement pour déclencher le clonage du joueur
game.Players.PlayerAdded:Connect(function(joueur)
    -- Connecte cette fonction à l'événement PlayerAdded pour chaque nouveau joueur
    joueur.CharacterAdded:Connect(function()
        -- Connecte cette fonction à l'événement CharacterAdded pour chaque nouveau personnage
        clonerJoueur(joueur.Character) -- Cloner le personnage du joueur
    end)
end)