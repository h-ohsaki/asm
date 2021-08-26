target remote :1234
file add
break *main
display/x $w19
display/x $w20
display/4i $pc
