#!/bin/bash

id=$1
val=$2

xinput set-prop $id "libinput Natural Scrolling Enabled" $val
