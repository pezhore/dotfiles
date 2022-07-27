# Pezhore dotfiles

Getting my dotfiles in order - this repo contains my dot files that reside across a few systems.


Contents: 

```
.
├── .gitignore
├── LICENSE
├── Makefile                # Stow Helper
├── README.md               # This file
├── .stow-local-ignore      # Stow ignore file
├── vim
│   └── .vimrc              # VIM config
└── zsh
    ├── .zsh_aliases        # ZSH Aliases
    └── .zshrc              # ZSH config
```

## Interesting Things

I have a homelab Hashicorp Vault cluster - and use it to store multiple environment variables, secrets, etc.

Various zsh aliases use a combination of `jq` and `vault` to help keep my dot files clean.