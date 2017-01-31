require("config")

function wifi_connect(onConnect)

    local config = config.wifi

    wifi.sta.eventMonReg(wifi.STA_GOTIP, function()
        wifi.sta.eventMonReg(wifi.STA_GOTIP) -- unregister

        print("Connected: " .. wifi.sta.getip())
        onConnect()
    end

    wifi.setmode(wifi.STATION)
    wifi.sta.config(config.ssid,config.password)

end
