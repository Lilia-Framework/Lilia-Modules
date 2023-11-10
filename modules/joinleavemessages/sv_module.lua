﻿--------------------------------------------------------------------------------------------------------------------------
util.AddNetworkString("PlayerJoinedLeftAnnouncement")
--------------------------------------------------------------------------------------------------------------------------
function MODULE:PlayerDisconnected(ply)
    net.Start("PlayerJoinedLeftAnnouncement")
    net.WriteString(ply:Nick() .. " left the server.")
    net.WriteBool(false)
    net.Broadcast()
end

--------------------------------------------------------------------------------------------------------------------------
function MODULE:PlayerInitialSpawn(ply)
    net.Start("PlayerJoinedLeftAnnouncement")
    net.WriteString(ply:Nick() .. " entered the server.")
    net.WriteBool(true)
    net.Broadcast()
end
--------------------------------------------------------------------------------------------------------------------------
