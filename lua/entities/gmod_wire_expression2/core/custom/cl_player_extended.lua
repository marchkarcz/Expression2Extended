E2Helper.Descriptions["doDamage"] = "Makes a player take damage, with number one being the amount of damage and number two being the damage type (from https://wiki.garrysmod.com/page/Enums/DMG)"

net.recieve("consolemessage", function()
    local str = net.ReadString()
    print(str)
end)