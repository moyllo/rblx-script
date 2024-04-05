-- Vérifier si le jeu prend en charge la fonction sendMessage
if sendMessage then
    -- Message à envoyer dans le chat
    local messageToSend = "Bonjour tout le monde !"

    -- Appeler la fonction sendMessage avec le message à envoyer
    sendMessage(messageToSend)
else
    print("La fonction sendMessage n'est pas disponible dans ce jeu.")
end