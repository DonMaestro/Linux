#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.rc


PS1="[\e[3;95m\u@\h\e[0m \W] \\$ "


# Add this lines at the top of .bashrc:
# [[ $- == *i* ]] && source $HOME/.config/blesh/ble.sh --noattach

# your bashrc settings come here...



[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

source /usr/share/doc/pkgfile/command-not-found.bash




# pulseaudio latency
        #export PULSE_LATENCY_MSEC=16
	#export PIPEWIRE_LATENCY=512/48000

	#export _JAVA_AWT_WM_NONREPARENTING=1

export QSYS_ROOTDIR="/home/maestro/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/20.1/quartus/sopc_builder/bin"


# Add this line at the end of .bashrc:
# [[ ${BLE_VERSION-} ]] && ble-attach
