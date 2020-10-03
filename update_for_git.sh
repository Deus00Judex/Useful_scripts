#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y
expect "password"
send "<Enter Passwort here>"
printf "\nYour System is now up to date\n\n"
