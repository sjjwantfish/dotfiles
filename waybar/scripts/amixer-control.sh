#!/bin/bash
# 获取当前 volumn
currVol=$(amixer sget Master | grep  -Po "(\d+%)" | head -n 1)
# 去除%
currVol=${currVol//\%/}
step=2

if [[ $1 == "up" ]];then
    ((newVol=$currVol+$step))
else
    ((newVol=$currVol-$step))
fi
echo $newVol


amixer sset Master ${newVol}% >/dev/null
