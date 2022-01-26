clear
IP=$1
function status-fc
{	clear
	status=$(curl http://$IP/background_play_status | awk -F '[<>]' '/sid/{print $7}')
	clear
	sleep 3
	echo $status
	if [ "$status" -eq "1" ]
		then
			off
		else
			on
	fi
}

function off
{
	CHOICE=0
	status=$(curl http://$IP/background_play_status 2>/dev/null | awk -F '[<>]' '/sid/{print $7}')

	     until [ "$CHOICE" = "2" ]; do
			 clear
	         echo "Turned off"
			 echo ""
	         echo "Turn on radio?:"
	         echo ""
	         echo "  1: Yes"
	         echo "  2: No"
	         echo ""
			 read CHOICE
  		      case $CHOICE in
     		   	1)
					clear
       		 		curl http://$IP/Sendkey?key=7
					clear
       		 		sleep 2
					status-fc
       		 		;;
       		 	2)
        			echo "Exit."
        			exit
        			;;
     		   esac
			done
}

function on
{
	CHOICE=0
	clear
	volume=$(curl http://$IP/background_play_status | awk -F '[<>]' '/vol/{print $15}')
	clear
	sleep 1
          until [ "$CHOICE" = "4" ]; do
			echo "Turner on."
			echo ""
			echo "Volume level: $volume"
			echo "----------------"
			echo "What next?"
			echo ""
			echo "	1: Turn off radio"
			echo "	2: Volume level +1"
			echo "	3: Volume level -1"
			echo "	4: Exit"
			read CHOICE
			case $CHOICE in
				1)
					clear
					curl http://$IP/Sendkey?key=7
					clear
					status-fc
					;;
				2)
					clear
					curl http://$IP/Sendkey?key=9
					clear
					status-fc
					;;
				3)
					clear
					curl http://$IP/Sendkey?key=10
					clear
					status-fc
					;;
				4)
					exit
					;;
			esac
		done
}

status-fc
