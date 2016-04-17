[[ -s ~/.bashrc ]] && source ~/.bashrc

# git highlighter
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# sourcetree / git
alias sourcetree='open -a SourceTree .'

# paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

