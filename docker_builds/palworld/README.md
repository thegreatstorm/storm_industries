# Notes:
Requirements for pal to run.

Source: https://tech.palworldgame.com/dedicated-server-guide

To fix steamclient.so error run this in container.
* steamcmd +login anonymous +app_update 1007 +quit
* cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/