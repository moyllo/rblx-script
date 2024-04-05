--Get the StarterGui service
local StarterGui = game:GetService("StarterGui")
--Use a repeat to make sure we get our system message
--The repeat will only stop once the function successfully runs
repeat
	wait() --Wait to prevent crashing
	local Success = pcall(function()
		--Run SetCore method inside the pcall
		--The first argument of SetCore is the method we wish to use
		--In this case, the second argument is a dictionary of data for the chat message
		StarterGui:SetCore("ChatMakeSystemMessage", {
			Text = "This is a system message"; --The chat message
			Color = Color3.fromRGB(0, 255, 255); --Chat message color, defaults to white
			Font = Enum.Font.SourceSansBold; --Chat message font, defaults to SourceSansBold
			TextSize = 18 --Text size, defaults to 18
		})
	end)
until Success