# aliases
alias g='git'
alias gst='git status'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset head'
alias grhh='git reset head --hard'

# git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'

# will return the current branch name
function current_branch
    set -l ref (git symbolic-ref head 2> /dev/null)
    or return
    echo $ref | string replace refs/heads/ ''
end

function current_repository
    set -l ref (git symbolic-ref head 2> /dev/null)
    or return
    git remote -v | cut -d':' -f 2
end

# these aliases take advantage of the previous function
function ggpull
    git pull origin (current_branch)
end

function ggpush
    git push origin (current_branch)
end

function ggpnp
    git pull origin (current_branch) && git push origin (current_branch)
end
