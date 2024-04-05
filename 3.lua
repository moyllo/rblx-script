print("by chatgpt open");-- Obtenir le joueur
local player = game.Players.LocalPlayer

-- Créer une instance BodyVelocity pour propulser le joueur
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Ajuste la vitesse de propusion
bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0) -- Utilise une force maximale infinie pour une propulsion maximale
bodyVelocity.P = 10000 -- Réglage proportionnel pour une réactivité rapide
bodyVelocity.Parent = player.Character.HumanoidRootPart

-- Créer une instance BodyAngularVelocity pour faire tourner rapidement le joueur
local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
bodyAngularVelocity.AngularVelocity = Vector3.new(0, 20, 0) -- Ajuste la vitesse de rotation
bodyAngularVelocity.MaxTorque = Vector3.new(0, 10000, 0) -- Utilise un couple maximal élevé pour une rotation rapide
bodyAngularVelocity.P = 10000 -- Réglage proportionnel pour une réactivité rapide
bodyAngularVelocity.Parent = player.Character.HumanoidRootPart

-- Définir une fonction pour détecter les collisions avec d'autres joueurs
local function onTouched(hit)
    local humanoid = hit.Parent:FindFirstChildOfClass("Humanoid")
    if humanoid and humanoid.Parent ~= player.Character then
        -- Appliquer une force à l'autre joueur
        local flingForce = Instance.new("BodyVelocity")
        flingForce.Velocity = (hit.Position - player.Character.HumanoidRootPart.Position).unit * 100 -- Ajuste la force de propulsion
        flingForce.Parent = humanoid.Parent:FindFirstChild("HumanoidRootPart")
        flingForce.MaxForce = Vector3.new(0, 1000, 0) -- Ajuste la force maximale
        flingForce.P = 1000 -- Réglage proportionnel pour une réactivité rapide
        humanoid:TakeDamage(10) -- Fait subir un certain montant de dégâts au joueur touché
    end
end

-- Connecter la fonction à l'événement Touched du joueur
player.Character.HumanoidRootPart.Touched:Connect(onTouched)