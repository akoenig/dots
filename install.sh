#!/bin/bash

#
# dots
#
# Copyright(c) 2016 André König <andre.koenig@posteo.de>
# MIT Licensed
#
#

#
# @author André König <andre.koenig@posteo.de>
#

{ # this ensures the entire script is downloaded #

DOTS_REPOSITORY=https://github.com/akoenig/dots

if [ -z "$DOTS_HOME" ]; then
  DOTS_HOME="$HOME/.dots"
fi

dots_latest_version() {
  echo "v1.0.0"
}

if [ -d $DOTS_HOME ]; then
	cd $DOTS_HOME && git pull origin master
else
	git clone $DOTS_REPOSITORY $DOTS_HOME

	source "$DOTS_HOME/lib/profile"

	CURRENT_DOT=dots
	dots_profile_add "[ -f $DOTS_HOME/dots ] && source $DOTS_HOME/dots"
fi

} # this ensures the entire script is downloaded #
