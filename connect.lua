
wifi.setmode(wifi.STATION)
wifi.sta.config("myowndevices","possibly808would")
print(wifi.sta.getip())

function get()
   print("Doing get")
   http.get("http://192.168.0.167:8080/greeting", nil, function(code,data)
      if(code < 0) then
         print("Request failed")
      else
         print(code, data)
      end
   end)
end

tmr.register(0,5000,tmr.ALARM_AUTO, get)
tmr.start(0)
