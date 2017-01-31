require("config.lua")

local function handle_http_response(code,data)
    if(code < 200 or code > 299) then
       print("POST failed: " .. code)
   else
       print("Posted")
    end
 end

function send_read()
    local config = config.dhtsink
    local pin = 4
    local status, temp, humi, temp_dec, humi_dec = dht.read(pin)

    if status == dht.OK then
        
        local reading_json = string.format(
            '{"temp": %.2f, "humidity": %.2f, "source": "%s"}',
            temp, humi, config.device_id)

        print(reading_json)

        http.post(config.url,'Content-Type: application/json\r\n',
            reading_json, handle_http_response)
    elseif status == dht.ERROR_CHECKSUM then
        print( "DHT Checksum error." )
    elseif status == dht.ERROR_TIMEOUT then
        print( "DHT timed out." )
    end
end
