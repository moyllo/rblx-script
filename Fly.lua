local Players = game:GetService("Players")

-- Variable pour garder une trace si le script a déjà été exécuté
local scriptRan = false

-- Fonction pour téléporter un joueur à un autre joueur
local function teleportPlayer(player1, player2)
    local character1 = player1.Character
    local character2 = player2.Character
    
    if character1 and character2 then
        character1:SetPrimaryPartCFrame(character2.PrimaryPart.CFrame + Vector3.new(0, 3, 0))
    end
end

-- Récupérer tous les joueurs dans le lobby
local function getPlayersInLobby()
    local playersInLobby = {}
    for _, player in ipairs(Players:GetPlayers()) do
        -- Vérifier si le joueur est dans le lobby (vous devrez définir votre propre méthode pour déterminer le lobby)
        -- Par exemple, vérifier s'ils sont dans une certaine zone ou ont un certain tag
        if player.Character then
            table.insert(playersInLobby, player)
        end
    end
    return playersInLobby
end

-- Fonction pour téléporter chaque joueur à chaque autre joueur avec un intervalle de 2 secondes
local function teleportPlayers()
    local playersInLobby = getPlayersInLobby()
    for i, player1 in ipairs(playersInLobby) do
        for j, player2 in ipairs(playersInLobby) do
            if player1 ~= player2 then
                teleportPlayer(player1, player2)
                wait(2) -- Attendre 2 secondes avant de téléporter le prochain joueur
            end
        end
    end
end

-- Vérifier si le script a déjà été exécuté, sinon exécuter le script
if not scriptRan then
    teleportPlayers()
    scriptRan = true
end
