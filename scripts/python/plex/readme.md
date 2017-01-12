![alt tag](http://i66.tinypic.com/2qs5gs2.jpg)

Features
------------

- Differentiate between photo, audio and video playback
- Differentiates between multiple plex clients
- Reports the playback of multiple clients simultaneously. No need to run multiple script instances. Just fill in the names of the clients it should listen for.
- Ability to show Play Progress.
  - Automatically clears the device log to prevent cluttering the database (can be turned off)
- Automatically creates and updates an status user variable for each client specified in the settings. 
- Status Codes:
  - **1**: Plex Server Offline
  - **0**: Client Idle
  - **1**: Playing Video
  - **2**: Paused Video
  - **3**: Stopped Video
  - **11**: Playing Audio
  - **12**: Paused Audio
  - **13**: Stopped Audio
  - **21**: Showing Photo
  - **22**: Paused Slideshow

Preparation
------------
- In Domoticz create an text object for each of the plex clients you wish to monitor, write down their corresponding IDX.
- Open the script in notepad and change the domoticz and Plex IP/Port to match your own setup.
- Enter the names of the plex clients under dom_PlexPlayers and their corresponding text object IDX under dom_PlexPlayInfo_ID.
- Save the script.
PreparationIn Domoticz create an text object or each for of the plex clients you wish monitor, write down their corresponding IDXOpen the script in notepad and change the domoticz and plex IP/port to match your own setup.Enter the names of the plex clients under dom_PlexPlayers and their corresponding text object idx under dom_PlexPlayInfo_IDSave the script

Installation
-------------
- Place the script in the domoticz/scripts/python folder.
- Assign 0775 Permission to the script.
- Create a cronjob to attempt to run the script every 10 minutes.
> */10 * * * *  /home/pi/domoticz/scripts/python/plex.py


Authentication
---------------
The script is configured for Plex Servers that are setup NOT to use authentication. 
If your server does use authentication try the following: 
Under Plex Options>Server>Network you can specify which networks can access the server without authentication.
You can enter specific IP addresses or whole networks (e.g 192.168.0.1) don’t forget to add the subnet as shows in the settings description.
When using Plex Home: Fill in the plexToken parameter in the script. 
Follow [these](https://support.plex.tv/hc/en-us/articles/204059436-Finding-your-account-token-X-Plex-Token) instructions to retrieve the token.
