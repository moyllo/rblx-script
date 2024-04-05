print("by chatgpt fling");
local lp = game:FindService("Players").LocalPlayer

local function gplr(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for i,v in pairs(game:FindService("Players"):GetPlayers()) do
            table.insert(Found,v)
        end
    elseif strl == "others" then
        for i,v in pairs(game:FindService("Players"):GetPlayers()) do
            if v.Name ~= lp.Name then
                table.insert(Found,v)
            end
        end 
    elseif strl == "me" then
        for i,v in pairs(game:FindService("Players"):GetPlayers()) do
            if v.Name == lp.Name then
                table.insert(Found,v)
            end
        end 
    else
        for i,v in pairs(game:FindService("Players"):GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found,v)
            end
        end 
    end
    return Found 
end

TextButton.MouseButton1Click:Connect(function()
    local Target = gplr(TextBox.Text)
    if Target[1] then
        Target = Target[1]

        local Thrust = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
        Thrust.Force = Vector3.new(9999,9999,9999)
        Thrust.Name = "YeetForce"
        repeat
            lp.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
            Thrust.Location = Target.Character.HumanoidRootPart.Position
            game:FindService("RunService").Heartbeat:wait()
        until not Target.Character:FindFirstChild("Head")
    else
        notif("Invalid player")
    end
end)