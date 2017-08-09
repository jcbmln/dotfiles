function git_branch_name() {
  local branch_name="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  [[ -n $branch_name ]] && echo "$branch_name"
}

function git_repo_status(){
  local rs="$(git status --porcelain -b)"

  if $(echo "$rs" | grep -v '^##' &> /dev/null); then # is dirty
    echo "%F{yellow}"
  elif $(echo "$rs" | grep '^## .*diverged' &> /dev/null); then # has diverged
    echo "%F{magenta}"
  elif $(echo "$rs" | grep '^## .*behind' &> /dev/null); then # is behind
    echo "%F{red}"
  elif $(echo "$rs" | grep '^## .*ahead' &> /dev/null); then # is ahead
    echo "%F{blue}"
  else # is clean
    echo "%F{green}"
  fi
}

function prompt_git() {
  local bname=$(git_branch_name)
  if [[ -n $bname ]]; then
    local infos="$(git_repo_status)$bname%f"
    echo " $infos"
  fi
}