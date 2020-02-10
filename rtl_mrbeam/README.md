# RTL433 to MQTT Bridge hass.io addon
A hass.io addon for a software defined radio tuned to listen for Mr Beam ligts and publish them as events on sensor.mrbeam.

This hass.io addon is based on James Frys's project here: https://github.com/james-fry/hassio-addons
Which is in turn based on Chris Kacerguis' project here: https://github.com/chriskacerguis/honeywell2mqtt,
which is in turn based on Marco Verleun's rtl2mqtt image here: https://github.com/roflmao/rtl2mqtt

## Usage

1) Install the addon.

2) Start the addon

Look at developer-tools/state -> sensor.mrbeam and you should get events when
a light is turned on.

## Hardware

This has been tested and used with the following hardware

USB2.0 FM DAB DVB-T RTL2832U R820T2 RTL-SDR SDR Dongle Stick Digital TV Tuner Receiver
https://www.banggood.com/USB2_0-FM-DAB-DVB-T-RTL2832U-R820T2-RTL-SDR-SDR-Dongle-Stick-Digital-TV-Tuner-Receiver-with-Antenna-p-1353904.html?rmmds=search&cur_warehouse=CN

## Troubleshooting

If you see this error:

> Kernel driver is active, or device is claimed by second instance of librtlsdr.
> In the first case, please either detach or blacklist the kernel module
> (dvb_usb_rtl28xxu), or enable automatic detaching at compile time.

Then run the following command on the host

```bash
sudo rmmod dvb_usb_rtl28xxu rtl2832
```
