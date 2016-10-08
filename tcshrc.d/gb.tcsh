if ( ${USER} == "tony" ) then
    set path = ($path ~tiberius/bin ~tiberius/scripts)
endif

setenv HTTP_PROXY http://192.168.4.250:1863
setenv http_proxy http://192.168.4.250:1863
setenv FTP_PROXY http://192.168.4.250:1863
setenv ftp_proxy http://192.168.4.250:1863

alias   h1  "ssh 203.69.85.83"
alias   h2  "ssh 203.69.85.84"

set i = 3
while($i <= 20)
    set j = `expr 198 + $i`
    alias   "h"$i   "ssh 203.69.85.$j"
    @ i = $i + 1
end
unset i
unset j

alias   ht1  "ssh 203.69.85.89"
alias   ht2  "ssh 203.69.85.90"

#
# mytop for gb's DB Server
#
set i = 150
while($i <= 199)
    alias	"mytop"$i	"/usr/local/bin/mytop -s 2 -h 192.168.4.$i -u mytop -p rmZJzLUJZEca68BE"
    @ i = $i + 1
end
unset i
alias	"mytop250"	"/usr/local/bin/mytop -s 2 -h 192.168.4.250 -u mytop -p rmZJzLUJZEca68BE"
alias	"mytop1792"	"/usr/local/bin/mytop -s 2 -h 192.168.4.179 -P 3307 -u mytop -p rmZJzLUJZEca68BE"
alias	"mytop1793"	"/usr/local/bin/mytop -s 2 -h 192.168.4.179 -P 3308 -u mytop -p rmZJzLUJZEca68BE"

#
# gamebase's server
#
set i = 30
while($i <= 250)
    alias	$i	"ssh p$i.p.gamebase.com.tw"
    @ i = $i + 1
end
unset i

alias	11	"ssh 219.85.64.11"

#
# apache-top
#
set i = 1
while($i <= 30)
    alias	"at"$i	"/usr/local/bin/python /usr/local/bin/apache-top.py -u http://www$i.gamebase.com.tw/server-status"
    @ i = $i + 1
end
unset i

# 重設 prompt 讓基地內部可以顯示 ip address 於 prompt 上
if ( -e $SVN_TREE/bin/getip.sh ) then
    setenv ip `/bin/sh $SVN_TREE/bin/getip.sh host`
    set prompt='%{[1;35m%}%n%{[1;33m%}@%{[1;32m%}%m,%$ip%{[1;36m%}[%~]%{[1;37m\ek\e\\%}%#%{[0m%} '
endif

#alias   iii "ssh 124.9.6.55 -p 110"
