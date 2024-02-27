#/bin/bash

if [ ! $# -eq 1 ]; then
	echo "No arg, no setup"
	exit
fi

SCRIPT_DIR=$(cd `dirname $0` && pwd)

###########
# ALIASES #
###########

if [ $1 = "aliases" ]; then
	BASH_ALIASES_FILE=~/.bash_aliases

	# Create bash_aliases file if it not exists
	if [ ! -f "$BASH_ALIASES_FILE" ]; then
	  echo "- Creating file $BASH_ALIASES_FILE"
	  touch $BASH_ALIASES_FILE
	fi

	echo "- Copying aliases file to $BASH_ALIASES_FILE"
	cat $SCRIPT_DIR/aliases >> $BASH_ALIASES_FILE
fi

#######
# GIT #
#######

if [ $1 = "git" ]; then
	echo "- Configuring git profile"
	chmod u+x $SCRIPT_DIR/git_config.sh
	$SCRIPT_DIR/git_config.sh
fi

##########
# DOCKER #
##########

# Installation process from https://docs.docker.com/engine/install/ubuntu/
if [ $1 = "docker-ubuntu" ]; then
	echo "- Installing Docker"
	chmod u+x $SCRIPT_DIR/docker-ubuntu.sh
	$SCRIPT_DIR/docker-ubuntu.sh
fi

# Installation process from https://docs.docker.com/engine/install/fedora/
if [ $1 = "docker-fedora" ]; then
	echo "- Installing Docker"
	chmod u+x $SCRIPT_DIR/docker-fedora.sh
	$SCRIPT_DIR/docker-fedora.sh
fi
