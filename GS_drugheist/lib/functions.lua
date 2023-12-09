function progressbar(message, time)
    lib.progressBar({
        duration = time,
        label = message,
        position = 'bottom',
        useWhileDead = false,
    })
end

function napraviWaypoint(lokacija)
    SetNewWaypoint(lokacija)
end

function handshake()
    local igrac = PlayerPedId()

    RequestAnimDict("mp_common")
    while not HasAnimDictLoaded("mp_common") do
        Wait(500)
    end

    TaskPlayAnim(igrac, "mp_common", "givetake1_a", 8.0, 1.0, -1, 0, 0, false, false, false)

end

function Draw3DText(x, y, z, scl_factor, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function stvoriVozilo()
    ESX.Game.SpawnVehicle('burrito', Config.WeedVan, 0.0, function (vozilo)
        print(DoesEntityExist(vozilo), 'Vozilo se stvorilo')
        SetVehicleDoorsLocked(vozilo,1)
        SetVehicleAlarm(vozilo, true)
        SetVehicleAlarmTimeLeft(vozilo, 5000)
    end)
end
