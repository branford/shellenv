#
# 睡眠的方式
#
alias   SBoth   "sudo pmset -a hibernatemode 3"
alias   SRam    "sudo pmset -a hibernatemode 0"
alias   SHard   "sudo pmset -a hibernatemode 1"

# connect to 249 with svn server on l2.twbbs.org
# windows xp in parallel desktop
# -L 10.211.55.2:4389:192.168.4.251:995
#if ( -e /usr/local/bin/mosh || -e /usr/bin/mosh ) then
#    set check=`ifconfig -l | grep tun0`
#    if ( "$check" == '' ) then
#        alias   248 "ssh 219.85.64.248 -p 110"
#    else
#        alias   248 'mosh --ssh="ssh -p 110" 219.85.64.248'
#    endif
#else
    alias   248 "ssh 219.85.64.248 -p 110 -L 25189:192.168.4.10:995 -L 10189:192.168.8.101:3389 -L 5389:192.168.4.53:3389 -D 7771"
#endif

alias   249 "ssh 219.85.64.249 -p 110 -L 3690:192.168.4.248:3690 -L 25189:192.168.4.10:995 -L 10189:192.168.8.101:3389 -L 5389:192.168.4.53:3389 -D 7771"

alias   svpn "ssh 123.51.183.110 -p 110"

setenv TERM xterm-color

if ( -e /usr/local/git/bin ) then
    set path = (/usr/local/git/bin $path)
endif

# check at III office

# set java_home
set check=`/usr/libexec/java_home | & grep Unable`

if ( -e /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home ) then
    setenv JAVA_HOME /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
else if ( "$check" == '' ) then
    setenv JAVA_HOME `/usr/libexec/java_home`
endif

if ( $?JAVA_HOME ) then
    set path = ( "$JAVA_HOME/bin" $path)
endif

unset check
