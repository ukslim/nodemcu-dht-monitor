
function connect() 
   wifi.setmode(wifi.STATION)
   wifi.sta.config("myowndevices","possibly808would")
   print(wifi.sta.getip())
   start_reading()
end

function start_reading()
   timer = tmr.create()
   timer:register(60000,tmr.ALARM_AUTO,send_read)
   timer:start()
end

function send_read()
    pin = 4
    status, temp, humi, temp_dec, humi_dec = dht.read(pin)

    if status == dht.OK then
    
    -- Float firmware using this example
    print("DHT Temperature:"..temp..";".."Humidity:"..humi)
    http.post("http://192.168.0.167:8080/dhtReading",
        'Content-Type: application/json\r\n',
        '{"temp": '..temp..', "humidity": '..humi..', "source": "only one"}',
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

boot_timer = tmr.create()
boot_timer:register(5000, tmr.ALARM_SINGLE, connect)
boot_timer:start()