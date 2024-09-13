#!/bin/bash
feishu_window_id=$(yabai -m query --windows | jq '.[] | select(."app"=="Feishu") | .id')
yabai -m window "$feishu_window_id" --space 6
