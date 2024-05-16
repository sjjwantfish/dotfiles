#!/bin/bash
dir=$1
yabai -m window --swap $dir
[[ $? -eq 0 ]] && exit 0

display=$(yabai -m query --displays --display $dir | jq '.index')
[[ ! $display ]] && exit -1

dirWardSpace=$(yabai -m query --spaces | jq ".[] | select((.display==$display) and (.[\"is-visible\"]==true)) | .index")
[[ ! $dirWardSpace ]] && exit -1

yabai -m window --space $dirWardSpace --focus
