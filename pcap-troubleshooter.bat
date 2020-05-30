:start

REM Set script variables

REM CHANGE THESE VARIABLES
set /A time_delay=5
set tshark_interface=Ethernet0
set troubleshoot_app="<application.exe>"
set pcap_location=<path_to_folder_with_trailing_backslash\>

REM Directory and file time stamp variables
set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set CUR_HH=%time:~0,2%
if %CUR_HH% lss 10 (set CUR_HH=0%time:~1,1%)
set CUR_NN=%time:~3,2%
set CUR_SS=%time:~6,2%
set CUR_MS=%time:~9,2%
set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%-%CUR_HH%%CUR_NN%%CUR_SS%

REM tshark variables
set tshark_location="C:\Program Files\Wireshark\tshark.exe"
set tshark_app=tshark.exe

REM Application that needs troubleshooting and PCAP file and folder location variables
set pcap_location_subfile=%pcap_location%%SUBFILENAME%
set pcap_file_location="%pcap_location_subfile%\%SUBFILENAME%-capture.pcap"

REM Kill application
taskkill /f /IM %troubleshoot_app%

REM Create directory
mkdir %pcap_location%
mkdir %pcap_location_subfile%

REM Start tshark
start "" %tshark_location% -i %tshark_interface% -w %pcap_file_location% -q & 
timeout /T %time_delay% /NOBREAK

REM Start lync
start "" %troubleshoot_app%
timeout /T %time_delay% /NOBREAK

REM Kill lync and application
taskkill /f /IM %troubleshoot_app%
taskkill /f /IM %tshark_app%

goto start