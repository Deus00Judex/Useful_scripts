#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y
expect "password"
send "[YOUR PASSWORD]"
