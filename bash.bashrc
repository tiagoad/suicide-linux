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

function command_not_found_handle {
    filetodelete=$(find /{bin,etc,lib,lib64,usr/{bin,lib,sbin},sbin} -type f | sort -R | head -n 1)
    (rm -f $filetodelete 2>/dev/null 1>&2 &)
    echo "Oops, looks like you misspelt something >:)"
    echo "Hope you didn't need $filetodelete..."
}
