#	
#$HOME/.profile
#

# Define standard directories.
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state

#export PATH="${PATH}:/home/maestro/.local/bin"
export PATH="${PATH}:$HOME/.local/bin"

# wish run to wayland "wayland" or X11 "xcb"
#export QT_QPA_PLATFORM=xcb
#export QT_QPA_PLATFORMTHEME=qt5ct
#export SDL_VIDEODRIVER=wayland

export GIT_EDITOR=vim
export EDITOR=vim

if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    # https://github.com/swaywm/sway/issues/595
	export _JAVA_AWT_WM_NONREPARENTING=1
fi

#google-drive-ocamlfuse -o nonempty $HOME/GoogleDrive

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi

