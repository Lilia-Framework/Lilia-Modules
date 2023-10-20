----------------------------------------------------------------------------------------------
hook.Add(
    "GetMaxPlayerCharacter",
    "returnRankCharLimit",
    function(ply)
        local rank = ply:GetUserGroup()
        local defchars = lia.config.MaxCharacters
        if not rank then return defchars end
        if lia.config.OverrideCharLimit[rank] then return lia.config.OverrideCharLimit[rank] end

        return defchars
    end
)
----------------------------------------------------------------------------------------------