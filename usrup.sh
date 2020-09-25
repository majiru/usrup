#!/bin/sh

#Check if git repo is currently up to date.
git_up_to_date(){
	git status | grep -q 'up to date'
}

#If git repo is out of date update it,
#if not, bail and return an error.
#Implements update_func for usrup_do.
git_update_if_needed(){
	git fetch
	if git_up_to_date; then
		return 1
	fi
	git pull origin master 2> /dev/null >/dev/null
}

meson_build(){
	meson build
	ninja -C build
}

meson_install(){
	sudo ninja -C build install
}

make_install(){
	sudo make install
}

#usage: usrup_do subdir is_up_to_date_func build_or_install_commands...
usrup_do(){
	prog=$1
	cd "$1"
	shift
	if ! eval "$1"; then
		cd ..
		return 1
	fi
	shift
	for i in $*; do
		if ! eval $i >/dev/null; then
			echo building $prog failed
			cd ..
			return 1
		fi
	done
	cd ..
}

#usage: git_repo_do subdir build_or_install_commands...
git_repo_do(){
	dir=$1
	shift
	usrup_do $dir git_update_if_needed $* &
}

cd $1

. $2

wait
echo done
