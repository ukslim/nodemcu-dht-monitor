# nodemcu-dht-monitor
A temperature monitor in NodeMCU for ESP8266

So far, briefly tested and appears to work.

It's naive though - see TODOs.

TODO:

  - use rtctime and smtp to put timestamps on readings
  - deep sleep between readings
  - use rtcfifo to ride through outages in the collector
