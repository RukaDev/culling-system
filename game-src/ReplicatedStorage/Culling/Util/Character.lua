local CharacterUtil = {}

function CharacterUtil.getCharacter()
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local character = player.Character
	if not character or not character.Parent then
		character = player.CharacterAdded:wait()
	end
	return character
end

return CharacterUtil