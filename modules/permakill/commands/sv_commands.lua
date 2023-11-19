﻿--------------------------------------------------------------------------------------------------------------------------
lia.command.add(
    "pktoggle",
    {
        privilege = "Toogle Permakill",
        syntax = "<string target>",
        onRun = function(client, arguments)
            local target = lia.command.findPlayer(client, arguments[1])
            local tcharacter = target:getChar()
            if not lia.config.PKActive then
                client:notify("PKing isn't enabled! Enable it in the config!")
                return
            end

            if tcharacter:getData("canbepermakilled", false) then
                tcharacter:setData("canbepermakilled", false)
                client:notify("You have toggled this character's PK State to False.")
            else
                tcharacter:setData("canbepermakilled", true)
                client:notify("You have toggled this character's PK State to True. He will be PK'ed the next time he dies!")
            end
        end
    }
)
--------------------------------------------------------------------------------------------------------------------------
