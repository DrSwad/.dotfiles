#!/bin/zsh

## Load installation configuration
source config.sh || exit 1

## Create the CP relevant directories
mkdir -p $CP_HOME
mkdir -p $CP_SETUP

## Make the CP Interactor file executable
chmod +x $CP_SETUP/interact.py
