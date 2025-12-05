

function trigger_Gift()
    if mod.index == 1 then
        LoadPackages({Names = {
-- "Achilles",
-- "Aphrodite",
-- "Apollo",
"Arachne",
-- "Ares",
-- "Artemis",
-- "Athena",
-- "BiomeB",
-- "BiomeC",
-- "BiomeChaos",
-- "BiomeF",
-- "BiomeG",
-- "BiomeH",
-- "BiomeHub",
-- "BiomeI",
-- "BiomeIHouse",
-- "BiomeMap",
-- "BiomeN",
-- "BiomeO",
-- "BiomeOBoss",
-- "BiomeP",
"BiomeQ",
-- "BiomeQEnding",
-- "Bouldy",
"CatFamiliar",
"Cerberus",
-- "Chaos",
"Charon",
"Chronos",
"Circe",
"Demeter",
-- "Dev",
"Dionysus",
"Dora",
"Echo",
"Eris",
-- "Fates",
-- "FlashbackMelBlink",
"FrogFamiliar",
"Fx",
-- "GUI",
-- "GUI_Mouse",
"Hades",
"Hecate",
-- "Hephaestus",
-- "Hera",
"Heracles",
-- "Hermes",
-- "Hestia",
"HoundFamiliar",
"Hypnos",
"Icarus",
-- "Launch",
-- "MainMenu",
"Medea",
"Melinoe",
"Moros",
-- "Narcissus",
-- "Nemesis",
-- "Nyx",
-- "Odysseus",
"Persephone",
"PolecatFamiliar",
"Polyphemus",
-- "Poseidon",
"Prometheus",
"RavenFamiliar",
-- "ScriptsBase",
"Scylla",
"Selene",
"Skelly",
-- "WeaponAxe",
-- "WeaponBlink",
-- "WeaponCast",
-- "WeaponDagger",
-- "WeaponLob",
-- "WeaponSpellLaser",
-- "WeaponSpellLeap",
-- "WeaponSpellMeteor",
-- "WeaponSpellMoonBeam",
-- "WeaponSpellPolymorph",
-- "WeaponSpellPotion",
-- "WeaponSpellSummon",
-- "WeaponSpellTransform",
-- "WeaponStaffSwing",
-- "WeaponSuit",
-- "WeaponTorch",
"Zagreus",
-- "Zeus",
}})
    end
    print(mod.EnemyArray[mod.index])
    print(#mod.EnemyArray)
    local  unit = mod.UnitData[mod.EnemyArray[mod.index]]
    local mesh = unit.GrannyModel
    local graphic = unit.Graphic
    SetThingProperty({ Property = "GrannyModel", Value = mesh, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "Graphic", Value = graphic, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "GrannyTexture", Value = "", DestinationId = CurrentRun.Hero.ObjectId })
    mod.index = mod.index + 1
    mod.index = (mod.index-1) % #mod.EnemyArray + 1
end

game.OnControlPressed({'Gift', function()
	return trigger_Gift()
end})



