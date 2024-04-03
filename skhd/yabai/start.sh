#!/bin/bash
ps -ef | grep yabai | grep -v grep >/dev/null
if [[ $? -eq 0 ]]; then
	yabai --restart-service
else
	yabai --start-service
fi

ps -ef | grep skhd | grep -v grep >/dev/null
if [[ $? -eq 0 ]]; then
	skhd --restart-service
else
	skhd --start-service
fi
