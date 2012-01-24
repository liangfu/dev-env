#!/usr/bin/env bash

if [ -z $1 ]
then
	echo "Usage: $0 <directory-path>"
fi

find $1 -name .svn -type d | xargs -n 1 rm -rf