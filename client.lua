RegisterNetEvent("radiusfix:fix")
AddEventHandler("radiusfix:fix", function(source)
    local pedVehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
    local nearestMechanic1 = GetBlipCoords(GetClosestBlipOfType(72))
    local nearestMechanic2 = GetBlipCoords(GetClosestBlipOfType(446))
    local pos = GetPedBoneCoords(GetPlayerPed(source), "0x2E28", 0, 0, 0)
    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, nearestMechanic1.x, nearestMechanic1.y, nearestMechanic1.z, false) <= radius or GetDistanceBetweenCoords(pos.x, pos.y, pos.z, nearestMechanic2.x, nearestMechanic2.y, nearestMechanic2.z, false) <= radius then 
        SetVehicleFixed(pedVehicle)
        notify("~g~Vehicle repaired.")
    else
        notify("~r~You must be near a mechanic shop to repair your vehicle.")
    end
    
end)

RegisterCommand("fix", function(source)
    TriggerEvent("radiusfix:fix", source)
end, false)

