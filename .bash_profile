# MacOS Debian config ------------------------------------------

export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export PATH="/usr/local/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# Custom functions ----------------

# Prompt utilities
parse_git_branch()
{
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Felt cute, might delete later
insert_emoji()
{
    is_in_repa=0

    while [ `pwd` != '/' ]; do
        if [[ -d './.git' ]]; then
            is_in_repa=1
            break
        fi
        cd ..
    done
    
    if [[ $is_in_repa == 1 ]]; then
        echo "🔧  "
    fi
}

mkcd()
{
	mkdir $1 && cd $1
}

cdp()
{
	TEMP_PWD='pwd'
	while ! [ -d .git ]; do
	cd ..
	done
	OLDPWD=$TEMP_PWD
}

# Bash prompt stuff ----------------

eval "$(rbenv init -)"

export PS1="\$(insert_emoji)\[\033[97m\]\u@\h\[\033[00m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \$ "

fortune | cowsay -f tux

# Aliases --------------------------

alias uu='brew update && brew upgrade'
alias ll='ls -al'
alias l='ls -CF'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
