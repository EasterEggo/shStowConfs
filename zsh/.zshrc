#asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/easteregg/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

source ~/.zplug/init.zsh

zplug "Aloxaf/fzf-tab"
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# install prompt
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '\C-H' backward-kill-word

export PATH="$PATH:$HOME/.local/bin/:$HOME/Documents/scripts/"
export FZF_DEFAULT_COMMAND="fd -H"
export FZF_DEFAULT_OPTS="-e -x --border --preview='bat --style=numbers --color=always --line-range :500 {}'"
export EDITOR="nvim"
export BROWSER="librewolf"
export TERM="xterm-256color"
export WPID="52"

alias ls='exa --icons'
alias cat='bat'
alias nv='nvim'

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

# funtoo keychain
eval `keychain --quiet --eval id_ed25519`

eval "$(atuin init zsh)"


source /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh

[ -f "/home/easteregg/.ghcup/env" ] && . "/home/easteregg/.ghcup/env" # ghcup-env
