alias   ls  'ls-F -FG'
# for pkg_add 方便直接網路安裝
setenv FTP_PASSIVE_MODE YES

set ARCH = `uname -p`
set VERSION = `uname -r | sed -e 's/\([0-9][0-9]*\.[0-9][0-9]*\).*/\1/'`

# 因為 pkg 的原故, 所以不再使用 PACKAGESITE 這個變數了
#setenv PACKAGESITE ftp://freebsd.csie.nctu.edu.tw/pub/FreeBSD/ports/$ARCH/packages-$VERSION-release/Latest/

alias	listen	'sockstat | sed s/127.0.0.1/\*/ | grep "*:[0-9]" | cut -c10-18,30-34,39-45 | sort -n -u +2'
set OS_REL=`uname -r|awk -F. '{print $1}'`
if ( $OS_REL <= 3 ) then
    unalias     ls
endif

#set OS_VERSION=`grep '^#d[a-z _]*FreeBSD[_a-z]*' /usr/src/sys/sys/param.h | awk '{print $3}'`
if ( $OS_REL  < 6 ) then
    unalias     grep
endif

# TERM
set MY_TERM=`echo $tty | cut -c 4`
set VERSION=`uname -r | awk -F. '{print $1}'`

if ( $VERSION <= 7) then
    set MY_TERM=`echo $tty | cut -c 4`

    if ( $MY_TERM == v ) then
        setenv TERM cons25
    else
        setenv TERM xterm-256color
    endif
else
    set MY_TERM=`echo $tty | cut -c 1-3`

    if ( $MY_TERM == tty ) then
        setenv TERM cons25
    else
        setenv TERM xterm-256color
    endif
endif

unset VERSION
unset MY_TERM
unset ARCH
unset OS_REL

