require("config.lua")

function send_read()
    local config = config.dhtsink
    local pin = 4
    local status, temp, humi, temp_dec, humi_dec = dht.read(pin)

    if status == dht.OK then

    print("DHT Temperature:"..temp..";".."Humidity:"..humi)

    http.post(config.url,
        'Content-Type: application/json\r\n',
        '{"temp": '..temp..', "humidity": '..humi..', "source": "'..config.device_id..''"}',
        function (code,data)
           if(code < 0) then
              print("Problem ", code)
           else
              print("Posted")
           end
        end)
    elseif status == dht.ERROR_CHECKSUM then
        print( "DHT Checksum error." )
    elseif status == dht.ERROR_TIMEOUT then
        print( "DHT timed out." )
    end
end
