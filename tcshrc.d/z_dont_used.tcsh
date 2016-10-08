
#switch ($OS)
#case "Linux":
#    breaksw
#
#case "FreeBSD":
#    breaksw
#
#endsw

#if ( $?TERM ) then
#    if ( $TERM == "xterm" || $TERM == "xterms" ) then
#        stty erase '^H'
#    endif
#endif

#stty 38400
#stty crt
#stty -tabs
#stty -istrip
#stty pass8

