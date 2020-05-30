# PCAP Troubleshooter

## Script Information - Please Read

This script was used to troubleshoot an intermittent authentication issue when launching the application.  The script loops through starting Wireshark and the troublesome application and creates pcaps for each loop.

The script does the following:

    1. Kills the application.
    2. Starts tshark.
    3. Launches the troublesome application.
    4. Waits the specified time and then kills the application and tshark.
    5. Writes the PCAP file to a specified destination with the time format YYYYMMDD-HHMMSS.
    6. Kills the application.

Don't forget to specify the following variables!

```
time_delay - Delay between starting tshark and application and how long the application should run

tshark_interface - Network interface you want tshark to listen on

troubleshoot_app - Application you're troubleshooting 

pcap_location - Directory to store PCAP files
```