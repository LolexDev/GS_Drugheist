--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
--─██████████████─████████████████───██████████████─██████──██████─██████████████────██████████████─██████████████─████████████████───██████████─██████████████─██████████████─██████████████─
--─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
--─██░░██████████─██░░████████░░██───██░░██████░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██████████─██░░████████░░██───████░░████─██░░██████░░██─██████░░██████─██░░██████████─
--─██░░██─────────██░░██────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██────────────██░░██─────────██░░██─────────██░░██────██░░██─────██░░██───██░░██──██░░██─────██░░██─────██░░██─────────
--─██░░██─────────██░░████████░░██───██░░██──██░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██─────────██░░████████░░██─────██░░██───██░░██████░░██─────██░░██─────██░░██████████─
--─██░░██──██████─██░░░░░░░░░░░░██───██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░░░██─────██░░██───██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─
--─██░░██──██░░██─██░░██████░░████───██░░██──██░░██─██░░██──██░░██─██░░██████████────██████████░░██─██░░██─────────██░░██████░░████─────██░░██───██░░██████████─────██░░██─────██████████░░██─
--─██░░██──██░░██─██░░██──██░░██─────██░░██──██░░██─██░░░░██░░░░██─██░░██────────────────────██░░██─██░░██─────────██░░██──██░░██───────██░░██───██░░██─────────────██░░██─────────────██░░██─
--─██░░██████░░██─██░░██──██░░██████─██░░██████░░██─████░░░░░░████─██░░██████████────██████████░░██─██░░██████████─██░░██──██░░██████─████░░████─██░░██─────────────██░░██─────██████████░░██─
--─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██───████░░████───██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░██─██░░██─────────────██░░██─────██░░░░░░░░░░██─
--─██████████████─██████──██████████─██████████████─────██████─────██████████████────██████████████─██████████████─██████──██████████─██████████─██████─────────────██████─────██████████████─
--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

local pricaosanpc = false
local zavrsioPosao = false
local eventsTriggered = false  

if Config.KoristiBlip == true then
  Citizen.CreateThread(function ()
    for i, v in pairs(Config.Blipovi) do
        local blip = AddBlipForCoord(v.Kordinate.x, v.Kordinate.y, v.Kordinate.z)
  
        SetBlipSprite(blip, v.Ikonica)
  
        if v.Boja ~= nil then
            SetBlipColour(blip, v.Boja)
        end
  
        SetBlipDisplay(blip, v.Pokazuj)
  
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Ime)  -- Stavi ime blipu
        EndTextCommandSetBlipName(blip)
  
  
        local display = v.Pokazuj
  
        SetBlipDisplay(blip, display)
    end
  end)
  else
    TriggerServerEvent('GS_drugheist:notUsingBlips')
end

Citizen.CreateThread(function()
    for _,v in pairs(Config.StartPed) do
      RequestModel(GetHashKey(v.model))
      while not HasModelLoaded(GetHashKey(v.model)) do
        Wait(1)
      end
      PostaviPeda = CreatePed(4, v.model, vector3(v.coords.x, v.coords.y, v.coords.z - 1) , v.coords.w, false, true)
      TaskStartScenarioInPlace(PostaviPeda, "WORLD_HUMAN_STAND_MOBILE", 0, true)
      FreezeEntityPosition(PostaviPeda, true) 
      SetEntityInvincible(PostaviPeda, true)
      SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
      exports.qtarget:AddBoxZone('zapocni', vector3(v.coords.x, v.coords.y, v.coords.z - 1), v.coords.w, 1.0, {
        name= 'zapocni',
        heading= v.coords.w,
        debugPoly= Config.Debug,
        minZ= v.coords.z -1,
        maxZ= v.coords.z +2,
        }, {
          options = {
            {
              action = function()
                  --TriggerServerEvent("GS_drugheist:startLog")
                  handshake()
                  progressbar(_U('startrobbery'), Config.ZapocniVreme * 1000)
                  ClearPedTasks(PlayerPedId())
                  napraviWaypoint(Config.EnemyMemberiWaypoint)
                  TriggerEvent("lolex:izvadi")
                  Wait(500)
                  ESX.ShowNotification(_U("gohere"), 10000, info)
                  pricaosanpc = true
              end,
              icon = "fas fa-piggy-bank",
              label = _U("startrobberyl"),
            },
          }
        })
    end
end)

Citizen.CreateThread(function()
  for _,v in pairs(Config.EndPed) do
    RequestModel(GetHashKey(v.model))
    while not HasModelLoaded(GetHashKey(v.model)) do
      Wait(1)
    end
    PostaviPeda = CreatePed(4, v.model, vector3(v.coords.x, v.coords.y, v.coords.z - 1) , v.coords.w, false, true)
    TaskStartScenarioInPlace(PostaviPeda, "WORLD_HUMAN_SMOKING", 0, true)
    FreezeEntityPosition(PostaviPeda, true) 
    SetEntityInvincible(PostaviPeda, true)
    SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
    exports.qtarget:AddBoxZone('zavrsi', vector3(v.coords.x, v.coords.y, v.coords.z - 1), v.coords.w, 1.0, {
      name= 'zavrsi',
      heading= v.coords.w,
      debugPoly= Config.Debug,
      minZ= v.coords.z -1,
      maxZ= v.coords.z +2,
      }, {
        options = {
          {
            action = function()
                if parkirao == true then
                  TriggerServerEvent('GS_drugheist:endLogs')
                  handshake()
                  progressbar(_U('endrobbery'), 5 * 1000)
                  ClearPedTasks(PlayerPedId())
                  Wait(500)
                  ESX.ShowNotification(_U("ended"), 5000, info)
                  TriggerServerEvent('GS_drugheist:end')
                  Wait(500)
                  zavrsio = true
                  if zavrsio then
                    TriggerEvent('lolex:zavrsetakV')
                    zavrsio = false
                  end
                  pricaosanpc = false
                  parkirao = false
                  eventsTriggered = false
                else
                  ESX.ShowNotification("messing", 7000, info)
                end
            end,
            icon = "fa-solid fa-key",
            label = _U("endrobberyl"),
            canInteract = function ()
              if parkirao == true then
                return true
              else
                return false
              end
            end
          },
        }
      })
  end
end)

RegisterNetEvent('lolex:izvadi', function()
  for k,v in pairs(Config.Vozila) do 
      ESX.Game.SpawnVehicle(v.modelauta, vector3(v.kordinatezaspawnauta.x, v.kordinatezaspawnauta.y, v.kordinatezaspawnauta.z), v.kordinatezaspawnauta.w, function(vozilo)
          TaskWarpPedIntoVehicle(PlayerPedId(), vozilo, -1)
      end)
  end
end)

RegisterNetEvent('lolex:zavrsetakV', function()
  for k,v in pairs(Config.Vozila) do 
      ESX.Game.SpawnVehicle(v.modelauta, vector3(v.kordinatezaspawnauta.x, v.kordinatezaspawnauta.y, v.kordinatezaspawnauta.z), v.kordinatezaspawnauta.w, function(vozilo)
          TaskWarpPedIntoVehicle(PlayerPedId(), vozilo, -1)
      end)
    end
end)


RegisterNetEvent('lolex:vrati', function ()
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), true))
    parkirao = true
else
    ESX.ShowNotification(_U("notin"))
  end
end)

local markerPozicija = vector3(-327.9126, 2789.6079, 59.2805)

Citizen.CreateThread(function ()
  local ped = GetPlayerPed(-1)
  while true do
    Citizen.Wait(0)
    local igracKorde = GetEntityCoords(ped)
    local distanca = #(igracKorde - markerPozicija)
    local jeUMarkeru = false
    local vozilo = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if distanca < 100.0 and GetEntityModel(vozilo) == GetHashKey('burrito') then
      DrawMarker(28, markerPozicija.x, markerPozicija.y, markerPozicija.z + 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 50, false, true, 2, nil, nil, false)
      if distanca < 2.0 then
        jeUMarkeru = true
      end
      else
        Citizen.Wait(2000)
    end

    if jeUMarkeru then
      TriggerEvent('lolex:vrati')
      TriggerServerEvent('GS_drugheist:vehicleLogEnd')
      Citizen.Wait(500)
      ESX.ShowNotification(_U('returned'))
    end
  end
end)

RegisterCommand('kreni', function ()
  pricaosanpc = true
end)

RegisterNetEvent('lolex:npcevi')
AddEventHandler('lolex:npcevi', function()

    local gdeDaSpawnaju = {
        vector4(1745.097, 3291.632, 41.103, 206.41),
        vector4(1737.483, 3293.477, 41.163, 206.41),
        vector4(1730.833, 3297.285, 41.223, 206.41),
        vector4(1738.119, 3286.475, 41.135, 206.41),
        vector4(1723.602, 3303.942, 41.223, 206.41),
        vector4(1737.484, 3310.934, 41.223, 206.41),
        vector4(1737.017, 3324.304, 41.223, 206.41),
    }


    function StvoriNpc(coords)
        local hash = GetHashKey("s_m_y_blackops_01") 
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Citizen.Wait(10)
        end

        AddRelationshipGroup('Attackers')
        SetPedRelationshipGroupHash(PlayerPedId(), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(5, GetHashKey("Attackers"), GetHashKey("PLAYER"))
        SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("Attackers"))

    
        local npc = CreatePed(5, hash, coords, true, true, true)
        GiveWeaponToPed(npc, GetHashKey("WEAPON_PISTOL"), 1000, false, true) 

        SetPedCombatAttributes(npc, 46, true) 
        SetPedCombatAttributes(npc, 0, true)
        SetPedCombatRange(npc, 2) 
        SetPedCombatMovement(npc, 3)
        SetCanAttackFriendly(npc, false, false)
        SetPedRelationshipGroupHash(npc, GetHashKey('Attackers'))
        SetModelAsNoLongerNeeded(hash)

 
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                local playerPed = PlayerPedId()
                local npcCoords = GetEntityCoords(npc)
                local playerCoords = GetEntityCoords(playerPed)
                local distance = GetDistanceBetweenCoords(npcCoords, playerCoords, true)
                if distance <= 40.0 and not IsPedInAnyVehicle(playerPed) then
                    TaskCombatPed(npc, playerPed, 0, 16)
                end
            end
        end)

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(30000)
                if IsEntityDead(npc) then
                    DeleteEntity(npc)
                    break
                end
            end
        end)
    end

    
    for _, coords in ipairs(gdeDaSpawnaju) do
        StvoriNpc(coords)
    end
end)

-- Citizen.CreateThread(function ()
--   local igrac = GetPlayerPed(-1)
--   while true do
--     Citizen.Wait(0)
--     local igracKorde = GetEntityCoords(igrac)
--     local distanca = #(igracKorde - Config.Hangar)
--     if distanca < 200.0 then
--       TriggerEvent("lolex:npcevi")
--       stvoriVozilo()
--     else
--       Citizen.Wait(2000)
--     end
--   end
-- end)

CreateThread(function ()
  while true do
    Wait(500) 

    local igrac = GetPlayerPed(-1)
    local vozilo = GetVehiclePedIsIn(igrac, false)

    if IsEntityAVehicle(vozilo) and GetEntityModel(vozilo) == GetHashKey('burrito') then
      napraviWaypoint(vector2(-325.4455, 2793.1326))
    end
end
end)

Citizen.CreateThread(function()
  local igrac = GetPlayerPed()
  while true do
      Citizen.Wait(30000)
      if IsEntityDead(igrac) then
          pricaosanpc = false
          break
      end
  end
end)

local eventsTriggered = false  

Citizen.CreateThread(function ()
    local igrac = GetPlayerPed(-1)
    while true do
        Citizen.Wait(0)
        local igracKorde = GetEntityCoords(igrac)
        local distanca = #(igracKorde - Config.Hangar)

        if distanca < 50.0 and pricaosanpc and not eventsTriggered then
            TriggerEvent('lolex:npcevi')
            stvoriVozilo()
            eventsTriggered = true  
        end

        Citizen.Wait(2000)  
    end
end)