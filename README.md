# Auto Installation
You can install driver in automatically mode.
To install driver automatically run in console:
```
curl -sSf https://raw.githubusercontent.com/MarcO-79/tbs-install/main/drv-tbs.sh | sh
```
# Check Driver
To check if the driver has been installed correctly, list adapters in the dvb directory:
```
ls /dev/dvb
```
Should be listed all adapters installed in the system. For example:
```
adapter0 adapter1 adapter2 adapter3 ...
```
# Troubleshooting
You can contact TBS representatives for help installing drivers at this link: https://www.tbsdtv.com/contact-us.html - select "Software installation and debugging"
If you have any issues with your DVB Adapters, please check DVB Troubleshooting
