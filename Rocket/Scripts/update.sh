#!/bin/bash
# This script installs / updates steamcmd and Unturned 3 on Linux machines
# Syntax: update.sh <steam username> <steam password>
# Author: fr34kyn01535
# Note: To make sure Steam Guard is not bugging you better create a new Steam account and disable Steam Guard

STEAM_USERNAME=$1
STEAM_PASSWORD=$2
STEAMCMD_HOME="$PWD/../../steamcmd"
UNTURNED_HOME="$PWD/../"

mkdir -p $STEAMCMD_HOME
mkdir -p $UNTURNED_HOME

cd $STEAMCMD_HOME
if [ ! -f "steamcmd.sh" ]; then
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
	tar -xvzf steamcmd_linux.tar.gz
	rm steamcmd_linux.tar.gz
fi

./steamcmd.sh +@sSteamCmdForcePlatformBitness 32 +login "$STEAM_USERNAME" "$STEAM_PASSWORD" +force_install_dir $UNTURNED_HOME +app_update 304930 validate +exit
# The Unturned 64 bit build seems to not work for some reason...
