### BashRC ###

#Alias
alias and="cd ~/programming/android"
alias g="git"
alias fb="clear && ECHO How does that put fish in bags?"
alias mc="clear; ECHO Magic counch, What should we do?; Sleep 3s; clear;  ECHO Nothing."
alias prof="nano ~/.bashrc && source ~/.bashrc"
alias gconfig="nano ~/.gitconfig"
alias updatereceiver="cp -r ~/programming/WebApps/Webcams_ReceiverApp/ /z/httpd/html"

alias monkey="adb shell monkey -p com.earthcam.controlcentereight.debug -v 50000"
alias monkeyk="adb shell ps | awk '/com\.android\.commands\.monkey/ { system(\"adb shell kill \" $2) }'"

__git_complete g __git_main

#Functions
uninst() { adb uninstall com.earthcam.$1; adb uninstall com.earthcam.$1.debug; }
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
clear;
str="Nothing."
for ((t=0; t<${#str}; t+=1));
do
echo -n "${str:$t:1}"
delay=$((RANDOM % 3))
sleep 0.$delay
done
}

convertPathToBash() {
f=$1
f="${f/C://c}"
f="${f//\\//}"
echo "$f"
}


#Path	
PATH=$PATH:/C/ProgramData/Oracle/Java/javapath:/C/windows/system32:/C/windows:/C/windows/System32/Wbem:/C/windows/System32/WindowsPowerShell/v1.0:"/C/Program\ Files\ \(x86\)/Intel/OpenCL SDK/1.5/bin/x86":"/C/Program\ 
Files\ 
\(x86\)/Intel/OpenCL\ SDK/1.5/bin/x64":"/C/Program Files/TortoiseSVN/bin":"/C/Program\ Files/Git/cmd":"/C/Program\ Files/TortoiseGit/bin":~/AppData/Local/Android/Sdk/platform-tools:"/c/Program 
Files/Java/jre-9.0.4/bin":"/C/Program Files/Android/Android Studio/bin":"/C/Program Files/Java/jdk-9.0.4/bin"
