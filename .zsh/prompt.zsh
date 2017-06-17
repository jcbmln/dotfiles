autoload -U colors && colors

export LSCOLORS="Gxfxcxdxbxegedabagacad"

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt multios
setopt prompt_subst

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
NORMAL="$(tput sgr0)"

# Git info
local git_info='$(git_prompt_info)'

GIT_PROMPT_PREFIX=" | "
GIT_PROMPT_SUFFIX="${NORMAL}"
GIT_PROMPT_DIRTY="${RED}✖${NORMAL}"
GIT_PROMPT_CLEAN="${GREEN}✓${NORMAL}"

local exit_code="%(?,,C:${RED}?${NORMAL})"

PROMPT="
${YELLOW}%n${NORMAL}@${BLUE}%m ${GREEN}%~${NORMAL}${git_info} $exit_code
${RED}> ${NORMAL}"