# special-octo-waffle
CLI AirMusic control internet radios

I bought new internet radio Kruger&Matz KM0816 that has capabilities to play DLNAs and network radio stations.
It had remote controller but also had Android application called AirMusic.
This is useful application that use simple HTTP-GET commands to control radio.
I wanted to use this feature to automate radio turning on / off when I am home or not

![screenshot](https://github.com/vitasrutek/special-octo-waffle/blob/main/radio.gif)

AirMusic uses more manufactures such as Audizio, Sencor, Silvercrest, GoGen.

## How To Use

```bash
# Clone this repository
$ git clone https://github.com/vitasrutek/special-octo-waffle

# Go into the repository
$ cd special-octo-waffle

# Run with device IP address
$ ./radio.sh 192.168.0.52
```

## At last..

```bash
$ curl http://$IP/Sendkey?key=7
# This is for turning on / off my device, but other Sendkey values do different things like change dimmer,
# change favorite station etc., but for my purpose this is enough.
```

```bash
#!/bin/bash is missing because of using script in Termux on Android.
```
