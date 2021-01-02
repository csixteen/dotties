if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

function exists {
        command -v "$1" &> /dev/null
}


# +------------------+
# | Load the goodies |
# +------------------+

for file in ~/.{paths,functions,aliases,shell_prompt}.sh; do
        [ -r "$file" ] && source "$file"
done
unset file


# +---------------------+
# |      History        |
# +---------------------+

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
# http://unix.stackexchange.com/a/48113
export HISTCONTROL="ignoredups"                        # no duplicate entries
export HISTSIZE=100000                                 # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                          # big big history
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear" # don't record certain commands

# shopt essentially toggles the values of settings. The flag `-s` enables (sets)
# the `histappend` option. When `histappend` is set, the history list is appended
# to the file named by the value of the `HISTFILE` env var when the shell exits.
# `type shopt` returns true if the argument `shopt` is found, and false otherwise.
shopt -s histappend  # append to history, don't overwrite it

# Forces Bash to save all lines of a multi-line command in the same
# history entry.
shopt -s cmdhist


# +-------------+
# | Fancy pager |
# +-------------+

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS="-R -X"                       # don't clear the screen on exit

export EDITOR=vim

case $(uname) in
        Linux)
                export TERM=rxvt-unicode
                ;;
esac


# +-----------------------+
# | Kubectl auto-complete |
# +-----------------------+

exists kubectl && source <(kubectl completion bash)


# +-------------------------------+
# | Any extra stuff you may need |

# +-------------------------------+
if [[ -e ".bashrc.local" ]]; then
        . ".bashrc.local"
fi
