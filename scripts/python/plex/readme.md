Features
------------

- Differentiate between photo, audio and video playback
- Differentiates between multiple plex clients
- Reports the playback of multiple clients simultaneously. No need to run multiple script instances. Just fill in the names of the clients it should listen for.
- Ability to show Play Progress
  -Automatically clears the device log to prevent cluttering the database (can be turned off)
- Automatically creates and updates an status user variable for each client specified in the settings. 
- Status Codes:
  -**1**: Plex Server Offline
  - **0**: Client Idle
  - **1**: Playing Video
  - **2**: Paused Video
  - **3**: Stopped Video
  - **11**: Playing Audio
  - **12**: Paused Audio
  - **13**: Stopped Audio
  - **21**: Showing Photo
  - **22**: Paused Slideshow

Installation
------------
