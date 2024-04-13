#!/bin/sh

# on arch linux install the AUR package lib32-ncurses5-compat-libs

SCRIPT_PATH="$(readlink -f $_)"
SCRIPT_DIR="$(dirname $SCRIPT_PATH)"
GAME_DIR="$SCRIPT_DIR/garrysmod"
REPOS="$GAME_DIR/gamemodes/militaryrp;https://github.com/milou2764/militaryrp
	$GAME_DIR/addons/bolemosaio;https://github.com/reskihed0311/bolemosAiO
	$GAME_DIR/addons/tompms;https://github.com/milou2764/tompms"

for r in $REPOS
do
	set $(echo "$r"|sed "s/;/ /")
	git -C "$1" pull || git clone $2 $1
done

export LD_LIBRARY_PATH=$SCRIPT_DIR/bin
$SCRIPT_DIR/srcds_linux\
	-maxplayers 32\
	-steam\
	-allowdebug\
	+map gm_flatgrass\
	+host_workshop_collection 2873795275\
	-steam_dir="$HOME/.local/share/Steam"\
	-steamcmd_script=/usr/lib/steamcmd\
	-autoupdate\
	+gamemode militaryrp
