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
export BROWSER="zen-browser"
export TERM="xterm-256color"
export WPID="52"

alias ls='exa --icons'
alias cat='bat'
alias nv='nvim'

# funtoo keychain
eval `keychain --quiet --eval id_ed25519`

eval "$(atuin init zsh)"
_fastanime_completion() {
    local -a completions
    local -a completions_with_descriptions
    local -a response
    (( ! $+commands[fastanime] )) && return 1

    response=("${(@f)$(env COMP_WORDS="${words[*]}" COMP_CWORD=$((CURRENT-1)) _FASTANIME_COMPLETE=zsh_complete fastanime)}")

    for type key descr in ${response}; do
        if [[ "$type" == "plain" ]]; then
            if [[ "$descr" == "_" ]]; then
                completions+=("$key")
            else
                completions_with_descriptions+=("$key":"$descr")
            fi
        elif [[ "$type" == "dir" ]]; then
            _path_files -/
        elif [[ "$type" == "file" ]]; then
            _path_files -f
        fi
    done

    if [ -n "$completions_with_descriptions" ]; then
        _describe -V unsorted completions_with_descriptions -U
    fi

    if [ -n "$completions" ]; then
        compadd -U -V unsorted -a completions
    fi
}

if [[ $zsh_eval_context[-1] == loadautofunc ]]; then
    # autoload from fpath, call function directly
    _fastanime_completion "$@"
else
    # eval/source/. command, register function for later
    compdef _fastanime_completion fastanime
fi

[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && \
  source "$EAT_SHELL_INTEGRATION_DIR/zsh"

