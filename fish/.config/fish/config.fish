if status is-interactive
    # Commands to run in interactive sessions can go here
end
eval (ssh-agent -c)
starship init fish | source
source ~/.asdf/asdf.fish
