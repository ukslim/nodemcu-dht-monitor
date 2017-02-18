# nodemcu-dht-monitor
A temperature monitor in NodeMCU for ESP8266

Very simply, reads from a DHT module on the standard pin once a minute, and makes an HTTP PUT containing the reads.
The HTTP body is in InfluxDB API format, but of course you can tweak it to whatever you like.

So far, briefly tested and appears to work.

It's naive though - see TODOs.

TODO:

  - use rtctime and smtp to put timestamps on readings
  - deep sleep between readings
  - use rtcfifo to ride through outages in the collector
