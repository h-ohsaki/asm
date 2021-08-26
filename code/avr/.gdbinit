target sim
load
break _start
display/x $r16
display/x $r17
display/4i $pc
display/8b 0x800060
