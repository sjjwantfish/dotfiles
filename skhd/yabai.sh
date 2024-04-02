#!/bin/bash

MAX_SPACE=9

function get_spaces_count {
	echo $(yabai -m query --spaces | jq length)
}

# 定义 focus_space 函数
function focus_space {
	create_spaces
	yabai -m space --focus $1
}

function create_spaces {
	local target_count=$MAX_SPACE
	local current_count=$(get_spaces_count)

	while [ $current_count -lt $target_count ]; do
		yabai -m space --create
		current_count=$((current_count + 1))
	done
}

function start_yabai {
	ps -ef | grep yabai | grep -v grep >/dev/null
	if [[ $? -eq 0 ]]; then
		yabai --restart-service
	else
		yabai --start-service
	fi
}
function start_skhd {
	ps -ef | grep skhd | grep -v grep >/dev/null
	if [[ $? -eq 0 ]]; then
		skhd --restart-service
	else
		skhd --start-service
	fi
}

function get_current_display_pos() {
	echo $(yabai -m query --displays --display | jq '.frame | .x,.y')
}

function swap_win() {
	direct=$1
	yabai -m window --swap $direct
	if [[ $? -eq 0 ]]; then
		return
	fi
	# TODO
	# 判断 $direct 方向是否还有 display
	# 获取这个 display 的 id ，is-visible 的 space
	# 将需要 swap 的 Window 放到这个 space 上
}

function test() {
	pos=$(get_current_display_pos)
	pos_x=$pos[0]
	pos_y=$pos[1]
	echo $pos_x
	echo $pos_y
}

if [ $# -eq 0 ]; then
	echo "未提供任何参数"
	exit 0
fi

first_arg=$1
shift # 移除第一个参数，剩余参数向前移动一个位置

case $first_arg in
"start")
	start_yabai
	start_skhd
	;;
"focus_space")
	focus_space "$@"
	;;
"test")
	test "$@"
	;;
*)
	echo "未知参数: $first_arg"
	;;
esac
