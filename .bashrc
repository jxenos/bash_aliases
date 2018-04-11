# -------
# Aliases
# -------

alias clr="clear"

#git
alias com="git commit"
alias st="git status"
alias br="git branch"
alias che="git checkout"
alias add="git add"
alias revert="git reset HEAD"

alias glog="git --no-pager log --pretty=oneline --decorate  -10"
alias nlog="git --no-pager log --pretty=oneline --decorate"
alias graph="git --no-pager log --pretty=oneline --decorate --graph --all"

#adb
alias adb="~/AppData/Local/Android/sdk/platform-tools/adb"
alias intent="adb shell am start -W -a android.intent.action.VIEW"
alias intent_ec="intent -d "https://cc8.earthcam.net""

#android studio
alias studio="/c/Program\ Files/Android/Android\ Studio/bin/studio64.exe"
alias st-diff="studio diff"

#keytools
alias keytool="/c/Program\ Files/Java/jdk1.8.0_121/bin/keytool"
alias listkeys="keytool -list -v -keystore"

alias gw="ECHO Strong work Tom!!!"
alias gwj="clear && echo Strong work Jorj!!!"
