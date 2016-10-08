setenv LC_ALL en_US.UTF-8
setenv LANG en_US.UTF-8

unset autologout
#set autologout=(10 5)

if ($USER == 'cytseng') then
    set path = (/usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /usr/X11R6/bin /bin /sbin ~/local/bin ~/svn_files/FreeBSD/6.x/bin)

    #setenv CONNECT_USER gamebase
    #setenv CONNECT_PASSWORD 88888888
    setenv CONNECT_USER branford
    setenv CONNECT_PASSWORD basara
else
    set path = (/usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /usr/X11R6/bin /bin /sbin)
endif

limit coredumpsize 0

set noclobber
set ignoreeof
set notify

set history = 50000
set savehist = 30000
set cdexpr = '.*/\(.*/.*\)$'

set autolist
set recexact

set autoexpand
set autocorrect

set matchbeep = ambiguous
#set correct = cmd
set correct = all

set time=100
set symlinks = ignore
set listlinks
set listjobs
set rmstar
set showdots

# 顏色參考
# http://www.matrix44.net/blog/?p=870
# For colorful man pages
setenv LESS_TERMCAP_mb "[0m"
# 指令 和 參數
setenv LESS_TERMCAP_md "[02;36;40m" # 藍字
# 其他內文
setenv LESS_TERMCAP_me "[0m"
# 最下面一整行
setenv LESS_TERMCAP_se "[0m"
# 最下面 byte
setenv LESS_TERMCAP_so "[01;33;44m" # 黃字
setenv LESS_TERMCAP_ue "[0m"
# the value of parameter
setenv LESS_TERMCAP_us "[02;31;40m" # 紅字

setenv CLICOLOR_FORCE

# same ls -G
set CLICOLOR="true"
setenv LESS "-Esrm"

set color

# 參考
# http://geoff.greer.fm/lscolors/
setenv LSCOLORS "gafacadabaegedabagacad"

setenv LESSCHARDEF "8bcccbcc18b95.."

setenv BLOCKSIZE K
setenv METAMAIL metamail
#setenv PAGER "less -Em"
setenv PAGER "`which less` -s"
setenv BROWSER `echo $PAGER`
setenv SPAMTRAP 'spam,delete,remove'

alias	cd..	'cd ..'
alias	lo	'exit' 
alias	cp	'cp -i'
alias	mv	'mv -i'
alias	df	'df -h'

alias	dir	'ls -alF | more -r'
alias	cls	'clear'
alias	ls   'ls -FG'
alias	grep	'grep --color'
alias   less    'less -r'

alias  kbt 'ssh kbt.mingann.info -p 110'
alias  idb 'ssh localadmin@10.10.22.1'

set vim=`which vim | grep -v found`
set vi=`which vi | grep -v found`
if ( "$vim" != "" ) then
    setenv EDITOR $vim
    alias	vi	'vim'
else
    setenv EDITOR $vi
endif
unset vim
unset vi

# %n = username
# %m = The hostname up to the first `.'
# %~ = The current working directory
# %% = A single `%'.
# \ek\e\\ 為了讓 screen 能抓取正在執行那支程式
set prompt='%{[1;35m%}%n%{[1;33m%}@%{[1;32m%}%m%{[1;36m%}[%~]%{[1;37m\ek\e\\%}%%%{[0m%} '
set prompt2 = "(%t %m)%~ #%% "
set prompt3 = "%SDo you mean [%R] (y/n/e) ? "

