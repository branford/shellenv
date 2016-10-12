if ( -e '/usr/local/git/bin/git' ) then
    set GIT = '/usr/local/git/bin/git'
else
    set GIT=`where git`
endif
set MBA=''

if ( "$OS" == 'Darwin' ) then
    set MY_TERM=`echo $tty | cut -c 4-`
    set MBA=`sh -c 'system_profiler SPHardwareDataType 2>/dev/null| grep Identifier | grep Air'`

else
    set MY_TERM=`echo $tty`
    set PTY=`echo $tty | cut -c 1-3`
    if ( "$PTY" == 'pts' ) then
        set MY_TERM=$PTY
    endif
    unset PTY
endif

# git 環境確認及說明
# 判斷使用者, 是否使用 tmux, 判斷 git, 判斷 git tree, 判斷 screen, 判斷非 console(?)
# if Mac
#  if MBA 筆電能移動, 所以要用 socks 同步
#   if check gitgw.sh, socks port 1111 , s001, git
#    GIT_CHECK='True'
#   else
#    GIT_CHECK=''
#   endif
#  else # MacMini 現在放在固定地點, 所以用鎖 ip 方式同步
#   if s001
#    GIT_CHECK='True'
#   else
#    GIT_CHECK=''
#   endif
#  endif
# else # BSD or Linux 基本上都是鎖固IP
#  if pty, TMUX, git
#    GIT_CHECK='True'
#  else
#    GIT_CHECK=''
#  endif
# endif

if ( "$USER" == 'cytseng' ) then
    if ( "$OS" == 'Darwin' ) then
        if ( "$MBA" != '' ) then
            set checksocks=`netstat -na | grep 1111`
    
            if (( -e $HOME/svn_files/FreeBSD/6.x/bin/gitgw.sh ) && ( "$checksocks" != '' )) then
                setenv GIT_PROXY_COMMAND $HOME/svn_files/FreeBSD/6.x/bin/gitgw.sh
            endif
    
            if (( -e $HOME/svn_files/FreeBSD/6.x/bin/gitgw.sh ) && ( "$checksocks" != '' ) && ( "$MY_TERM" == 's001' ) && ( "$GIT" != '' )) then
                set GIT_CHECK='True'
            else
                set GIT_CHECK=''
            endif
    
            unset $checksocks
        else
            if (( "$MY_TERM" == 's001' ) && ( "$GIT" != '' )) then
                set GIT_CHECK='True'
            else
                set GIT_CHECK=''
            endif
        endif
    else
        if ((( $MY_TERM == 'ttyv0' ) || ($MY_TERM == 'pts' )) && (${?TMUX} == '0') && ( "$GIT" != '' )) then
                set GIT_CHECK='True'
        else
                set GIT_CHECK=''
        endif
    endif
else
    set GIT_CHECK=''
endif

# 在璞園內可使用 git 同步, 只先處理 FreeBSD 的部份
#if ($GIT_CHECK == 'True' && (`domainname` == 'PYCT' || "$checktun" != '')) then
if ($GIT_CHECK == 'True') then
    echo 'update git tree'

    if ( -e $CYHOME/svn_files/FreeBSD ) then
        cd $CYHOME/svn_files/FreeBSD
        $GIT pull
    endif

    cd $CYHOME/svn_files/shellenv
    $GIT pull
    cd
endif

unset GIT
unset MY_TERM
unset GIT_CHECK
unset MBA
