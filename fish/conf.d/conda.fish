function conda_raw
    if test -f /Users/zhangruobin/miniforge3/bin/conda
        eval /Users/zhangruobin/miniforge3/bin/conda "shell.fish" hook $argv | source
    else
        if test -f "/Users/zhangruobin/miniforge3/etc/fish/conf.d/conda.fish"
            . "/Users/zhangruobin/miniforge3/etc/fish/conf.d/conda.fish"
        else
            set -x PATH /Users/zhangruobin/miniforge3/bin $PATH
        end
    end
end

function conda
    if not set -q _conda_loaded
        conda_raw
        set _conda_loaded 1
    end
    conda $argv
end
fish_add_path $HOME/miniforge3/bin/
