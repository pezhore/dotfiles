# If you come from bash you might have to change your $PATH.
export PATH=$HOME/go/bin:/usr/local/bin:$HOME/.local/bin:/usr/local/go/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

COMPLETION_WAITING_DOTS="true"
ZSH_THEME_GIT_PROMPT_USFFIX="%{$reset_color%}\n "
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bundler
  dotenv
  git
  z
  zsh-syntax-highlighting
  kubetail
)

source $ZSH/oh-my-zsh.sh


# pull in the kubectl completion
source <(kubectl completion zsh)

if [ -f "$HOME/.vault-token" ]; then
    rm "$HOME/.vault-token"
fi

export GPG_TTY=$(tty)
export ANSIBLE_NOCOWS=1
export VAULT_SKIP_VERIFY=true
export VAULT_TLS_SKIP_VERIFY=true

setopt HIST_IGNORE_SPACE

# DO FUN THINGS!
fortune | pokemonsay

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# If I'm on my home network, I can point to my homelab's Vault cluster.
# Otherwise, I can run a local vault on my workstation
if [ "$LOCAL_VAULT" ]; then
  export VAULT_ADDR="https://127.0.0.1:8200"
  export LOCALVAULT="https://127.0.0.1:8200"
else
  export VAULT_ADDR="https://10.0.0.90"
  export LOCALVAULT="https://10.0.0.90"
fi

echo -n "Hashicorp Vault ($VAULT_ADDR) "

vault login -method=userpass username=pez > /dev/null

source ~/.zsh_aliases

localvaultload          # From .zsh_aliases (loads a ton of environment vars from Hashicorp Vault)

export GOVC_INSECURE=true

export VSPHERE_USER=$GOVC_USERNAME
export VSPHERE_PASSWORD=$GOVC_PASSWORD
export VSPHERE_SERVER=$GOVC_URL

export TF_VAR_vsphere_user=$GOVC_USERNAME
export TF_VAR_vsphere_password=$GOVC_PASSWORD
export TF_VAR_vsphere_server=$GOVC_URL

export GOPATH=$HOME/go

source ~/.conda_init

# Added by ProtonUp-Qt on 22-03-2023 10:14:47
if [ -d "/home/deck/stl/prefix" ]; then export PATH="$PATH:/home/deck/stl/prefix"; fi

eval $(thefuck --alias)

eval "$(starship init zsh)"
