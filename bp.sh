#!bin/bash
for cont in `gawk '{print $1}' cont.list`
do
	cd $cont
	for wf in `ls *SAC`
	do
		########## Band-pass filter. You may change frequency range 2-8 Hz.  #################################
                ######################################################################################################
		echo $wf | gawk '{print"r "$1"\nrmean;rtr,taper\nbp p 2 n 4 c 2 8\nw append .bp\nquit"}' | sac
                ######################################################################################################
                ######################################################################################################


		########## Desampling data. You may change frequency range 2-8 Hz and sampling rate 0.05  #############
                ######################################################################################################
		#echo $wf | gawk '{print"r "$1"\nrmean;rtr,taper\nbp p 2 n 4 c 2 8\ninterpolate delta 0.05\nw append .bp\nquit"}' | sac
                ######################################################################################################
                ######################################################################################################
	done
	cd ..
done
