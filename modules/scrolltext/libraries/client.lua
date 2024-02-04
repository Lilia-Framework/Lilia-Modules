﻿---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
local SCROLL_X = ScrW() * 0.9
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
local SCROLL_Y = ScrH() * 0.7
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
function MODULE:HUDPaint()
    local curTime = CurTime()
    for k, v in pairs(lia.scroll.buffer) do
        local alpha = 255
        if v.start and v.finish then
            alpha = 255 - math.Clamp(math.TimeFraction(v.start, v.finish, curTime) * 255, 0, 255)
        elseif v.nextChar < curTime then
            v.nextChar = CurTime() + 0.01
            v.char = string.char(math.random(47, 90))
        end

        lia.util.drawText(v.text .. v.char, SCROLL_X, SCROLL_Y - (k * 24), Color(255, 255, 255, alpha), 2, 1)
        if alpha == 0 then
            if v.callback then v.callback() end
            table.remove(lia.scroll.buffer, k)
        end
    end
end
---------------------------------------------------------------------------[[//////////////////]]---------------------------------------------------------------------------
