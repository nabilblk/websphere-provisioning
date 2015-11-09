#!/usr/bin/env bash
/opt/IBM/WebSphere/AppServer/profiles/PROFILE_DMGR_01/bin/startManager.sh
/opt/IBM/WebSphere/AppServer/profiles/PROFILE_APP_01/bin/startNode.sh
/opt/IBM/WebSphere/AppServer/profiles/PROFILE_APP_01/bin/startServer.sh AppServer01


