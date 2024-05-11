

#-----------------------------------------#
#   Powered by Vladimir `rifux` Blinkov   #
#  https://github.com/rifux/post-install  #
#                                         #
#           Licensed under MIT            #
#-----------------------------------------#


# Set the CONFIG_FISH_HOME variable to the user's home directory if it's not already set
set -q CONFIG_FISH_HOME || set CONFIG_FISH_HOME "$HOME/.config/fish"


# Aliases
# -------

# Display all aliases with descriptions
alias aliases="$CONFIG_FISH_HOME/progs/aliases.sh"

# Use 'btop' instead of 'htop'
alias htop="btop"

# Use 'bat' instead of 'less' for viewing man pages
function man 
    command man --pager=cat $argv | command bat --language man -p
end

# View the help text of an entered command using 'bat'
function gethelp
    eval "$argv --help | bat --language man -p"
end

# Improved 'eza' aliases
alias el="eza -balo --no-permissions --icons always"
alias eld="eza -baloD --no-permissions --icons always"
alias elf="eza -balof --no-permissions --icons always"
alias et="eza -aT --icons always"
alias etd="eza -aTD --icons always"
alias etf="eza -aTf --icons always"
alias etl="eza -aT --icons always --level"
alias etdl="eza -aTD --icons always --level"
alias etfl="eza -aTf --icons always --level"

# Improve UX of 'mkdir'
function mkdir
    command mkdir -pv $argv | command bat --language bash -n --pager cat
end

# Make single dir & move into it
function mkcd
    # Check if there are more than one arguments or there are any brace expansions or multiple directories
    if test (count $argv) -gt 1 || string match '{' (echo $argv | string join " ")
        command echo "mkcd: Creating multiple directories with a single command is not allowed."
        return 1
    end
    eval "mkdir -pv $argv | bat --language bash -n --pager cat && cd $argv"
end

# Improved 'rm' aliases
alias rmf="rm -fv"
function rm
    command rm -vI $argv | command bat --language bash -n --pager cat
end

# Improved 'cp' aliases
function cp
    command cp -iv $argv | command bat --language bash -n --pager cat
end
alias cpf="cp -v"

# Improved 'mv' aliases
function mv
    command mv -iv $argv | command bat --language bash -n --pager cat
end
alias mvf="mv"

# New 'wget' aliases
alias wget-mirror="wget -c -m --tries=inf --wait=0 --waitretry=5 --ignore-length --max-redirect=inf --retry-on-host-error --convert-links --page-requisites --adjust-extension --no-parent"
alias fetch="wget --quiet --progress=bar --show-progress"
