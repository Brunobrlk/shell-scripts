#!/bin/bash

# Author: Bruno Guimarães
# Description: Setup a Linux environment on Debian systems
# Version: 1.0
# Last Updated: 20/09/2025

logs() { echo -e "\033[0;32m[BRLK SUCCESS]\033[0m - $1"; }
loge() { echo -e "\033[0;31m[BRLK ERROR]\033[0m - $1"; }
logw() { echo -e "\033[1;33m[BRLK WARNING]\033[0m - $1"; }
logi() { echo -e "\033[0;34m[BRLK INFO]\033[0m - $1"; }
logd() { echo -e "\033[0;35m[BRLK DEBUG]\033[0m - $1"; }
log() { echo -e "[BRLK] - $1"; }
