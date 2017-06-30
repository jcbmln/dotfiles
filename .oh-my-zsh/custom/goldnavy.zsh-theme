# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# June 2017 Jacob Malone

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %F{white}on%f git:%F{cyan}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}o"

local exit_code="%(?,,%F{red}%?%f)"

# Prompt format:
#
# PRIVILEGES USER @ MACHINE in DIRECTORY on git:BRANCH STATE [TIME] C:LAST_EXIT_CODE
# $ COMMAND
#
# For example:
#
# user@host ~/.oh-my-zsh on git:master x 0
# >
PROMPT="
%F{yellow}%n%f@%F{blue}%m %F{magenta}%~%f${git_info} $exit_code
%F{cyan}> %f"
