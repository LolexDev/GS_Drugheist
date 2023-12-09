Config = {}

Config.EnemyMemberiWaypoint = vector2(1734.3293, 3305.3604) -- Kordinate waypointa X,Y // Coords for waypoint X,Y
Config.WeedVan = vector3(1731.1820, 3312.6814, 41.2235) -- Kordinate za kombi koji kradete // Coords for van that you steal
Config.Hangar = vector3(1737.84, 3286.24, 41.13) -- Kordinate gde se nalazi hangar // Coords where hangar is located
Config.Zavrsetak = vector3(-325.4455, 2793.1326, 59.1566) -- Kordinate gde je zavrsetak // Coords where is end of heist
Config.KoristiBlip = true -- Da li zelite da se na mapi pojavi blip dilera ostavite na true,a ako ne onda stavite na false // If u want to have blip on map of dealer don't change it from true but if u don't want to have blip set it to false
Config.ZapocniVreme = 5 -- U sekundama // In seconds
Config.Locale = 'en' -- rs za Srpski en za Engleski // rs for Serbian en for English
Config.Dobitak = math.random(3000,4000) -- Dobitak(Nagrada) kad doveze kombi // Reward after stealing the van

-- # Webhook Config
Config.LogHeader = "GS DRUGHEIST » Logs"
Config.Webhook = "https://discord.com/api/webhooks/1181965370609913897/dValWtx6_IqY1SzCMR_9hiNMQBIOfxxBElVqIJ-J2FvVrDVO7-iRxUHHQUAP5TBBufEG" -- Discord webhook
-------------------------------------------------------

Config.Blipovi = {
    {
        Ime = "Diler", -- Ime blipa // Name of blip
        Velicina = 1, -- Velicina blipa // Size of blip
        Boja = 6, -- Boja blipa // Color of blip
        Ikonica = 480, -- Blip sprite // Blip sprite
        Kordinate = vector3(3416.533, 3754.882, 30.5737), -- Kordinate blipa // Coords of blip
        Pokazuj = 6, -- Display
    }
}

Config.StartPed = { -- Start ped for heist
    {
    coords = vector4(3416.533, 3754.882, 30.5737, 140), -- Coords of ped
    model = 'a_m_m_soucent_02' -- Ped
    },
}

Config.EndPed = { -- End ped for heist
    {
    coords = vector4(-325.4455, 2793.1326, 59.1566, 147.3898), -- Coords of ped
    model = 'ig_djgeneric_01' -- Ped
    },
}

Config.Vozila = {
    {
    kordinatezaspawnauta = vector4(3412.8279, 3755.8882, 30.5745, 142.0758), -- Coords to spawn vehicle
    modelauta = 'baller', -- Vehicle Model
    },
    {
        kordinatezaspawnauta = vector4(-328.5907, 2789.2122, 59.3160, 49.9365), -- Coords to spawn vehicle
        modelauta = 'sanchez', -- Vehicle Model
    }
}