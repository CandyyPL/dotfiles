#!/bin/bash

id=$(xinput list | rg 'USB OPTICAL MOUSE' | rg -v 'Keyboard' | awk '{print $6}' | tr -d 'id=')

$HOME/scripts/set-natural-scrolling.sh $id 0

