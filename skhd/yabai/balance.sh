#!/bin/bash
for s in $(yabai -m query --spaces | jq ".[] | select(.\"is-visible\"==true) | .index"); do
	yabai -m space $s --balance
done
