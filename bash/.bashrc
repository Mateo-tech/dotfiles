#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (C) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT
# References:
#   http://stackoverflow.com/questions/19092488/custom-bash-prompt-is-overwriting-itself/19501525#19501528
#   http://mywiki.wooledge.org/BashFAQ/053


compile_prompt () {
  local ARROW=$'\u25B6'
  local c_gray='\e[01;30m'
  local c_blue='\e[0;34m'
  local c_cyan='\e[0;36m'
  local c_reset='\e[0m'

  PS1="${c_gray}"

  # > Username
  # Format:
  #   (bracket open)(username)(bracket close)(splitbar)
  PS1+="[${c_blue}\u@\h${c_gray}]"

  # > Working Directory
  # Format:
  #   (bracket open)(working directory)(bracket close)(newline)
  PS1+="[${c_blue}\w${c_gray}]"

  # > Arrow
  # NOTE: Color must be escaped with '\[\]' to fix the text overflow bug!
  # Format:
  #   (arrow)(color reset)
  PS1+="\$ \[\e[0m\]"
}

# PROMPT_COMMAND='compile_prompt'

# (user@host) (working dir) (arrow)
# PS1="\e[01;30m[\e[0;36m\u@\h\e[01;30m\e[01;30m][\e[0;36m\w\e[01;30m\e[01;30m]\$ \e[0;34m"
