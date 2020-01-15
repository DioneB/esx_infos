ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountProf()
	local xPlayers = ESX.GetPlayers()
	CopsConnected = 0
	SamuConnected = 0
	MecConnected = 0
	CarConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'bope' then
			CopsConnected = CopsConnected + 1
		elseif xPlayer.job.name == 'samu' then
			SamuConnected = SamuConnected + 1
		elseif xPlayer.job.name == 'mecano' then
			MecConnected = MecConnected + 1
		elseif xPlayer.job.name == 'cardealer' then
			CarConnected = CarConnected + 1
		end
	end
		local Policiais = CopsConnected
        local Bombeiros = SamuConnected
		local Mecanicos = MecConnected
		local Conce = CarConnected
		ExecuteCommand(string.format("sets Status \"| 🚓 %2d | 🚑 %2d | 🔧 %2d | 🚗 %2d |\"", Policiais, Bombeiros, Mecanicos, Conce))
	SetTimeout(60000, CountProf)

end

CountProf()
