# Path configurations
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
fish_add_path $HOME/.n/bin
fish_add_path $BUN_INSTALL/bin
fish_add_path $HOME/Episodes/work/tools/ralay
fish_add_path /usr/local/bin
fish_add_path /Library/Frameworks/Mono.framework/Versions/Current/bin
fish_add_path $JAVA_HOME/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path $HOME/.yarn/bin
fish_add_path $HOME/.config/yarn/global/node_modules/.bin
fish_add_path $HOME/Episodes/dev-env/flutter/flutter/bin
fish_add_path /opt/homebrew/opt/gradle@7/bin
fish_add_path /usr/local/share/dotnet/shared

# Environment variables
set -gx GITLAB_TOKEN jjX5h43-g7NUHbtfyNGh
set -gx GITLAB_URL "https://git.zuoyebang.cc/"
set -gx N_PREFIX "$HOME/.n"
set -gx N_PRESERVE_NPM 1
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx SDKROOT /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk


# API Keys
set -gx WULAI_KEY sk-E1LwWj60TEnwJDxwNMnziH9Eb7aKLMXMwO0eaWu3UC3S2eSF
set -gx TENCENT sk-W4Zo3ubgfLUpdwEdkjEgtGCptb5fdB2WSLbj2R9FQivoXR4a
set -gx V3 sk-6e0AWRIkB8A6RNyX724796D42b3c4f72Ac967eC73aF87a63
set -gx CHATNIO_KEY sk-d599e329ca8d5387cdfb53f25b142a90e9a213971000e7ad6de1fe6604d30674
set -gx OPENAI_API_KEY sk-1pXLDJ88IP9JMTB7DkSBD6aBA97KaGhNG7UkGmRnLWMugu4B
set -gx DEEPSEEK_API_KEY sk-532a260e25204faab22bbb98ca28a235
# set -gx DEEPSEEK_API_KEY sk-W4Zo3ubgfLUpdwEdkjEgtGCptb5fdB2WSLbj2R9FQivoXR4a
set -gx ANTHROPIC_API_KEY sk-GoEYDtbe3cmQwWqH715a7f4155024b0cA1805dDc1aF85b45

# Aliases
alias af="aichat -r %functions%"
alias pack="glab ci run -b (git rev-parse --abbrev-ref HEAD) && watch -n 1 'glab ci list | head'"
alias leet="nvim leetcode.nvim"
alias trans="aichat --role translator"
# Language and encoding settings
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# Java related
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/jdk-21.0.4.jdk/Contents/Home

# Go proxy
set -gx GOPROXY https://goproxy.cn,direct

# zoxide initialization
zoxide init fish | source

# Proxy settings
set -gx https_proxy http://127.0.0.1:7890
set -gx http_proxy http://127.0.0.1:7890
set -gx all_proxy socks5://127.0.0.1:7890

# Spring and Maven related
set -gx JAVA_SPRING_OPTS "-Dpmd.skip=true -Dlogging.path=/tmp/java/"
set -gx SPRING_PROFILES_ACTIVE dev
set -gx MVND_HOME $HOME/Episodes/dev-env/java/mvnd

# More aliases
alias sd="shiprs deploy"
alias st="shiprs tail"
alias ss="shiprs select"

# Rust related
set -gx RUST_BACKTRACE 1

# OpenAI configuration
set -gx OPENAI_API_HOST "https://api.openai-proxy.org"
set -gx openai_api_endpoint "https://api.openai-proxy.org/v1/chat/completions"

# File descriptor limit
ulimit -n 4096

# Editor and image related aliases
alias icat="wezterm imgcat"
alias nvd="/Applications/neovide.app/Contents/MacOS/neovide --frame=transparent --title-hidden --fork"
alias v="nvim -c ''"

# CGO settings
set -gx CGO_ENABLED 1

# Library paths and PKG_CONFIG path
set -gx LD_LIBRARY_PATH /opt/homebrew/Cellar/graphene/1.10.8/lib:/opt/homebrew/Cellar/gtk4/4.14.4/lib:/opt/homebrew/Cellar/libadwaita/1.5.0/lib:$LD_LIBRARY_PATH
set -gx PKG_CONFIG_PATH /opt/homebrew/Cellar/graphene/1.10.8/lib/pkgconfig/:$PKG_CONFIG_PATH

# Other aliases
alias pico="sh /Library/Application\ Support/PICO/Streaming\ Service.app/Contents/Resources/ps_server_wrapper.sh"
alias hh=hstr
alias h=hstr

# FZF configuration
set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# More aliases
alias ue5='echo Please use ue instead.'
alias cmt='git add . && git diff --cached | sgpt "generate git commit message and describe message and commit, notice: describe also need to commit, must commit use function call"'
alias amt='git add . && aichat -e %functions% "there are diffs in <diffs >< /diffs >. <diffs >$(git add . && git diff --cached) </diffs >write commit detail message and commit, this is very important. just generate commit command. use function call direct"'

# More useful aliases
alias ll="exa -l --icons"
alias gitremote="open https://(git config --get remote.origin.url | sed 's/\.git//' | sed 's/git@//' | sed 's/:/\//')"
alias cat="bat"
# alias rm="trash"
alias pdf='zathura'
alias margin='open -a /Applications/MarginNote\ 3.app/'

set -gx EXPORTED_VARS_LIMIT 10000000
# source /Users/zhangruobin/.gvm/scripts/gvm
# set -gx CONDA_HOME "$HOME/miniforge3/"
# set -gx PATH $CONDA_HOME/bin $PATH
# status --is-interactive; and . /Users/zhangruobin/miniforge3/etc/fish/conf.d/conda.fish
set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include
fish_add_path /opt/homebrew/opt/llvm/bin
