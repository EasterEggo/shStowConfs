# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
FPATH="$HOME/.docker/completions:$FPATH"
setopt autocd extendedglob nomatch
bindkey -v
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

eval "$($HOME/.local/bin/oh-my-posh init zsh --config 'pure')"

source ~/.zplug/init.zsh

zplug "Aloxaf/fzf-tab"
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "mafredri/zsh-async", from:github

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
export BROWSER="floorp"
export TERMINAL="ghostty"
export TERM="xterm-256color"
export WPID="52"

alias cat='bat'
alias cd='z'
alias nv='nvim'

eval "$(atuin init zsh)"
_viu_completion() {
    local -a completions
    local -a completions_with_descriptions
    local -a response
    (( ! $+commands[viu] )) && return 1

    response=("${(@f)$(env COMP_WORDS="${words[*]}" COMP_CWORD=$((CURRENT-1)) _VIU_COMPLETE=zsh_complete viu)}")

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
    _viu_completion "$@"
else
    # eval/source/. command, register function for later
    compdef _viu_completion viu
fi

eval "$(zoxide init zsh)"
eval "$(/bin/mise activate zsh)"
