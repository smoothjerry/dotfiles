autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

export GPG_TTY=$(tty)

# Go
export PATH=$PATH:/Users/jared.decesare/go/bin

# Python
alias py='python3'

[[ -f ~/.config/zsh/work.zsh ]] && source ~/.config/zsh/work.zsh
