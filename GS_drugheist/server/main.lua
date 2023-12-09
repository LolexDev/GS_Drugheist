assert(GetCurrentResourceName() == "GS_drugheist", _U('license')) -- Ne diraj te // Do not touch¸

RegisterNetEvent("GS_drugheist:startLog", function ()
    local igrac = ESX.GetPlayerFromId(source)
    -- Zapoceo pljacku // Started heist
    discordlogs("GS Drugheist » Logs", "["..igrac.identifier.."] [" ..GetPlayerName(igrac.source).. "] je zapoceo pljacku na lokaciji [" ..GetEntityCoords(GetPlayerPed(igrac.source)).."]")
end)

RegisterNetEvent('GS_drugheist:notUsingBlips', function ()
    print(_U("noblips"))
end)

RegisterNetEvent('GS_drugheist:endLogs', function ()
    local igrac = ESX.GetPlayerFromId(source)
    -- Zavrsio pljacku // Ended heist
    discordlogs("GS Drugheist » Logs", "["..igrac.identifier.."] [" ..GetPlayerName(igrac.source).. "] je zavrsio pljacku na lokaciji [" ..GetEntityCoords(GetPlayerPed(igrac.source)).."]")
end)

RegisterNetEvent('GS_drugheist:vehicleLogEnd', function ()
    local igrac = ESX.GetPlayerFromId(source)
    -- Dovezao vozilo na marker // Bringed vehicle to the marker
    discordlogs("GS Drugheist » Logs", "["..igrac.identifier.."] [" ..GetPlayerName(igrac.source).. "] je predao vozilo na lokaciji [" ..GetEntityCoords(GetPlayerPed(igrac.source)).."]")
end)

RegisterNetEvent('GS_drugheist:end', function ()
    local igrac = ESX.GetPlayerFromId(source)
    local novac = Config.Dobitak
    igrac.addMoney(novac)
end)

function discordlogs(name, message)
    local vreme = os.date("*t")
    local poruka = {
        {
            ["color"] = 2061822,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"]= "Vreme: " .. vreme.hour .. ":" .. vreme.min .. ":" .. vreme.sec,
            },
        }
      }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.LogHeader, embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
  end