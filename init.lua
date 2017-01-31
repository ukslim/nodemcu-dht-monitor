require("connect")
require("dht_send")

local boot_timer = tmr.create()
boot_timer:register(5000, tmr.ALARM_SINGLE, connect(function()
    local read_timer = tmr.create()
    read_timer:register(60000,tmr.ALARM_AUTO,send_read)
    read_timer.start()
    end
))
boot_timer:start()
