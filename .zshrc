# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

[ -x "$(command -v tmux)" ] \
  && [ -z "${TMUX}" ] \
  && (tmux attach || tmux) >/dev/null 2>&1

export TERM="screen-256color"

ulimit -n 4864

ZSH_THEME="superjarin"
export ZSH=/Users/benjackson/.oh-my-zsh
JARIN_CURRENT_RUBY="%{$fg[white]%}[%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg[white]%}]%{$reset_color%}"

alias vi="vim"

plugins=(git)

source $ZSH/oh-my-zsh.sh
. $HOME/.asdf/asdf.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# # initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:/usr/local/protobuf/bin:/opt/homebrew/opt/postgresql@13/bin:$PATH"

export EDITOR=nvim
