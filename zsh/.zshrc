autoload -Uz compinit
compinit

export GPG_TTY=$(tty)

# Go
export PATH=$PATH:/Users/jared.decesare/go/bin

# Python
alias py='python3'

# Tools
source ~/.config/zsh/tools/starship.zsh
source ~/.config/zsh/tools/zoxide.zsh
source ~/.config/zsh/tools/direnv.zsh
source ~/.config/zsh/tools/worktrunk.zsh

[[ -f ~/.config/zsh/work.zsh ]] && source ~/.config/zsh/work.zsh
export AWS_CA_BUNDLE="/private/etc/netskope/netskope-cert-bundle.pem"
export NODE_EXTRA_CA_CERTS="/private/etc/netskope/netskope-cert-bundle.pem"
