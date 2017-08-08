setopt auto_cd
setopt multios
setopt prompt_subst

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
PROMPT='
%F{cyan}%n%f@%F{blue}%m %F{magenta}%~%f $(prompt_git) $exit_code
%F{green}> %f'

