autoload -Uz compinit
compinit

export GPG_TTY=$(tty)

# Go
[[ -d "$HOME/go/bin" ]] && export PATH="$PATH:$HOME/go/bin"

# Python
alias py='python3'

# Tools — each init is guarded, so a machine missing the tool is a no-op
source ~/.config/zsh/tools/starship.zsh
source ~/.config/zsh/tools/zoxide.zsh
source ~/.config/zsh/tools/direnv.zsh
source ~/.config/zsh/tools/worktrunk.zsh

# Machine-specific config, never committed (see .gitignore)
[[ -f ~/.config/zsh/work.zsh ]] && source ~/.config/zsh/work.zsh

export PATH="$HOME/.local/bin:$PATH"

# Corporate TLS interception. Only export when the bundle is actually present:
# pointing these at a missing file breaks pip, requests, and botocore on every
# TLS call, so the personal machine must not inherit them.
_ca_bundle=/private/etc/netskope/netskope-cert-bundle.pem
if [[ -r $_ca_bundle ]]; then
  export AWS_CA_BUNDLE="$_ca_bundle"
  export REQUESTS_CA_BUNDLE="$_ca_bundle"
  export PIP_CERT="$_ca_bundle"
  export NODE_EXTRA_CA_CERTS="$_ca_bundle"
fi
unset _ca_bundle
