### BashRC ###

#Alias
alias g="git"
alias brc="vi ~/.bashrc && source ~/.bashrc"
alias grc="vi ~/.gitconfig"
alias vrc="vi ~/.vimrc"

__git_complete g __git_main

#Functions
magic() {
clear
arg="Magic Counch, What should we do?"
for ((i=0; i<${#arg}; i+=1))
do
echo -n "${arg:$i:1}"
delay=$((Random % 3))
sleep 0.$delay
done
sleep 3;
printf "\n";
arr=("Nothing." "Follow the seahorse." "Try asking again.")
ans=$(shuf -i 0-$(expr ${#arr[*]} - 1) -n 1)
str=${arr[$ans]}
for ((t=0; t<${#str}; t+=1));
do
echo -en "\e[1;31m${str:$t:1}\e[0m"
delay=$((RANDOM % 3))
sleep 0.$delay
done
echo -e "\n"
}

convertPathToBash() {
f=$1
f="${f/C://c}"
f="${f//\\//}"
echo "$f"
}

#=====prompt===========================
git_branch() {
    # -- Finds and outputs the current branch name by parsing the list of
    #    all branches
    # -- Current branch is identified by an asterisk at the beginning
    # -- If not in a Git repository, error message goes to /dev/null and
    #    no output is produced
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_status() {
    # Outputs a series of indicators based on the status of the
    # working directory:
    # + changes are staged and ready to commit
    # ! unstaged changes are present
    # ? untracked files are present
    # S changes have been stashed
    # P local commits need to be pushed to the remote
    local status="$(git status --porcelain 2>/dev/null)"
    local output=''
    [[ -n $(egrep '^[MADRC]' <<<"$status") ]] && output="$output+"
    [[ -n $(egrep '^.[MD]' <<<"$status") ]] && output="$output!"
    [[ -n $(egrep '^\?\?' <<<"$status") ]] && output="$output?"
    [[ -n $(git stash list) ]] && output="${output}S"
    [[ -n $(git log --branches --not --remotes) ]] && output="${output}P"
    [[ -n $output ]] && output="|$output"  # separate from branch name
    echo $output
}

git_color() {
    # Receives output of git_status as argument; produces appropriate color
    # code based on status of working directory:
    # - White if everything is clean
    # - Green if all changes are staged
    # - Red if there are uncommitted changes with nothing staged
    # - Yellow if there are both staged and unstaged changes
    # - Blue if there are unpushed commits
    local staged=$([[ $1 =~ \+ ]] && echo yes)
    local dirty=$([[ $1 =~ [!\?] ]] && echo yes)
    local needs_push=$([[ $1 =~ P ]] && echo yes)
    if [[ -n $staged ]] && [[ -n $dirty ]]; then
        echo -e '\033[1;33m'  # bold yellow
    elif [[ -n $staged ]]; then
        echo -e '\033[1;32m'  # bold green
    elif [[ -n $dirty ]]; then
        echo -e '\033[1;31m'  # bold red
    elif [[ -n $needs_push ]]; then
        echo -e '\033[1;34m' # bold blue
    else
        echo -e '\033[1;37m'  # bold white
    fi
}

git_prompt() {
    # First, get the branch name...
    local branch=$(git_branch)
    # Empty output? Then we're not in a Git repository, so bypass the rest
    # of the function, producing no output
    if [[ -n $branch ]]; then
        local state=$(git_status)
        local color=$(git_color $state)
        # Now output the actual code to insert the branch and status
        echo -e "\x01$color\x02[$branch$state]\x01\033[00m\x02"  # last bit resets color
    fi
}

# Sample prompt declaration. Tweak as you see fit, or just stick
# "$(git_prompt)" into your favorite prompt.

echonewline() {
  echo -e '\n$ '
}

# first working in bash rc... new line was killing it but it parses so SLOW
#PS1='\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\H\[\e[0;39m\]:\e]\[\e[0;33m\]\w\[\e[1;35m\] $(git_prompt)\[\e[m$(echonewline)'

# testing
PS1='\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\H\[\e[0;39m\]:\e]\[\e[0;33m\]\w\[\e[1;35m\] $(git_branch)\[\e[m$(echonewline)'
