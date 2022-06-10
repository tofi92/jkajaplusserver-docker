#!/bin/bash


#  *********JA+ Linux server AutoRestart script*******************************
#  this is a secure startup file that uses the raven dedicated server pack for linux
#  if the server crashes, it will be immediatly restarted within 10s and the restart time will be writen to the file 
#     japlus_restart.txt
#  
# 
#  1)  install the raven dedicated server pack for linux (and the JAPLUS mod)
#  2)  and then put this file in your gamedata folder 
#  3)  then execute this  file to start your server with JA+ mod (don't forget the chmod +x)
# 
#  ****************************************


/bin/ps ux > ./.temp 
alive=`grep -l 'linuxjampded' ./.temp | wc -l`;
     
if [ $alive -eq 0 ]
then
     
     	lastrestart=`/bin/date`;
	echo "JA+ server restarted on $lastrestart" > ./japlus_restart.txt ;        
       

	nohup ./linuxjampded +set dedicated 2  +set fs_game japlus +exec server.cfg > echo;
   	      
          

        sleep 10;
        
        nohup ./start_japlus_linux_autoRestart.sh &
	
fi









