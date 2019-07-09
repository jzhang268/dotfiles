#!/bin/bash

output=/tmp/pscircle.png
TIME_INTERVAL=10

while [ 1 ]; do
	pscircle --output=$output --output-width=1920 --output-height=1080 --background-image=/home/jzhang268/dotfiles/pscircle/aks-void-space.png --background-image-scale=2 --max-children=35 --collapse-threads=false --tree-sector-angle=3.9269 --tree-center=350:300 --tree-rotate=true --tree-rotation-angle=3.5342 --tree-radius-increment=110 --dot-radius=2 --link-width=1.3 --tree-font-size=11 --toplists-font-size=12 --toplists-bar-width=30 --toplists-row-height=15 --toplists-bar-height=3 --cpulist-center=-100:-300 --memlist-center=400:-300 --interval=0 
	sleep $TIME_INTERVAL
	if command -v feh >/dev/null; then
        	feh --bg-scale  $output
        	rm $output
	fi
done

# --link-color-min=375143a0 --link-color-max=375143 --dot-color-min=7c762f --dot-color-max=b56e46 --tree-font-color=94bfd1 --toplists-font-color=C8D2D7 --toplists-pid-font-color=7B9098 --toplists-bar-background=444444 --toplists-bar-color=7d54dd

