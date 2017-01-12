GeoLocation using Tasker for Android
------------

This lua script processes GPS coordinates received from Tasker to calculate the distance from home and the address of your current location.
Values are stored in user variables and displayed in a Text Object.


There are three parts to this solution
- GeoLocation.lua
- GetAddress.lua
- Geo Task in Tasker

Preparation
------------
- Make sure Domoticz is reachable from outside your local network on a different port. setup port forwarding.
- Make sure to enable Basic Authentication in Domoticz to protect from outsiders
- Create a user variable of type string with the name 'Home Location'
- Create a user variable of type string with the name 'Current Location'
- Create a user variable of type float with the name 'DistanceFromHome'
- Create a text Object in domoticz with the name 'Location'
- Look up the GPS coordinates of your home. Enter your address on [gps-coordinates.net](http://www.gps-coordinates.net/) 
- Enter the GPS coordinates in the 'Home Location' User variable using the following format: <Latitude>,<Longitude> e.g. 52.395139,6.001595
- Install the Tasker Application on your android device

Installation - Setting Up Tasker
-------------
- Open Tasker and go the preferences, on the UI Tab unselect 'Beginner Mode'
- Press the logo in the top left corner to return to the previous page
- Create a new task in tasker, 
	- go to the tasks tab and press the Add button (+) in the lower right corner.
	- Enter a name and accept.
	- Add an new action: Location-> Get Location
		- Set Source to GPS for the highest accuracy
		- Leave Timeout at 100s
		- Press the logo in the top-left corner
	- Add a new action: Variables-> Set Variable
		- Under 'Name' enter: %LOCATION
		- Under 'To' Enter: %LOC
		- Press the '+' next to 'If' and enter: %LOC
		- Press the ~ button and select: 'Is Set'
		- Press the logo in the top left corner
	- Add a new action: Variables-> Set Variable
		- Under 'Name' enter: %LOCATION
		- Under 'To' Enter: %LOCN
		- Press the '+' next to 'If' and enter: %LOC
		- Press the ~ button and select: 'Is Not Set'
		- Press the logo in the top-left corner
	-Add a new action: Net->HTTP Get
		- Under Server:Port Add the following: <Username>:<Password>@<RemoteIP>:<RemotePort>/json.htm?type=command&param=updateuservariable&vname=Current%20Location&vtype=2&vvalue=%LOCATION
		- Press the logo in the top-left corner to return.
- Create a new profile
	- Go to the profiles tab and press the Add button (+) in the lower right corner
	- Select Time
	- Set the 'From' Time to whatever time you want the polling to start
	- Place a checkmark at `Repeat` and enter the polling interval . e.g. 10 minutes
	- Set the `To` Time to whatever time you want the polling to end
	- Press the logo in the top-left corner to return to the previous page .
	- From the list that appears select the task you just created. The profile is now created and active

- Test your task by opening it up and pressing the play-button.

Installation - LUA scripts
-------------
- Create a new lua time event in the domoticz event manager and copy/paste the code from the GeoLocation.lua file.
- Create a new lua user variable event in the domoticz event manager and copy/paste the code from the GetAddress.lua file.


Note
-----
You can change the user variable and object names to whatever you like, just make sure you edit the script files accordingly
