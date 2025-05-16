if status is-interactive
    # Commands to run in interactive sessions can go here
end
eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/zhangruobin/miniforge3/bin/conda
    eval /Users/zhangruobin/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/zhangruobin/miniforge3/etc/fish/conf.d/conda.fish"
        . "/Users/zhangruobin/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/zhangruobin/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<

