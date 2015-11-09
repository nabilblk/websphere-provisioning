#!/usr/bin/env bash
puppet apply profile_dmgr.pp --debug --verbose
# Hack the script : this is needed to run the dmgr script twice :
puppet apply profile_dmgr.pp --debug --verbose
# create APP profile
puppet apply profile_app.pp --debug --verbose
# create Application Server
puppet apply app_server.pp --debug --verbose
