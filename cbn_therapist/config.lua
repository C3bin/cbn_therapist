--  _____ _   _  ___________  ___  ______ _____ _____ _____ 
-- |_   _| | | ||  ___| ___ \/ _ \ | ___ \_   _/  ___|_   _|
-- | | | |_| || |__ | |_/ / /_\ \| |_/ / | | \ `--.  | |  
-- | | |  _  ||  __||    /|  _  ||  __/  | |  `--. \ | |  
-- | | | | | || |___| |\ \| | | || |    _| |_/\__/ / | |  
-- \_/ \_| |_/\____/\_| \_\_| |_/\_|    \___/\____/  \_/                                                        
                                                       
Config = {}

-- ADD YOUR STRESS EVENT IN SHARED/SH_EVENT.LUA

Config.Locale = 'en'
Config.Framework = "esx"-- Set the framework to either "qbcore" or "esx" based on your setup
Config.TargetSystem = 'qbtarget' -- ox_target, qtarget, qbtarget
Config.SkinSystem = 'illenium-appearance' -- Supported: fivem-appearance, illenium-apperance
Config.PriceForSitting = 500 -- Here you can configure price for a sitting
Config.TargetDistance = 2.5 -- From which distance can user see target
Config.UseStressSystem = false -- If true, it will use Supported Stress Systems below, if false you can add your custom event in shared/sh_event.lua
Config.StressSystem = 'codem' -- codem = CodeM BLVCK HUD V2 Stress System, codesign = Codesign Hud, ultra = Ultra Hud
Config.StressAmount = 100 -- How Much it will remove stress, UltraHud = 1000 = 100%
Config.TherapistBlip = {
    Blip = {
        Name = "<font face='Fire Sans'>TERAPEUT</font>",
        Pos = {x = -1898.4978, y = -572.5306, z = 11.8703},
        Sprite = 405,
        Display = 4,
        Scale = 0.8,
        Colour = 66
    }

}

