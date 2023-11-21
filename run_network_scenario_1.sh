#!/bin/bash
echo 'Networking project...'
echo "Gina Lopez and Valeria Azurduy"
PROBABILITIES=(0.05 0.1 0.2 0.3 0.4)
TIMEOUT=(0.1 0.3)
WINDOW=(2 5)
# for i in "${PROBABILITIES[@]}"
# do
# 	for j in "${TIMEOUT[@]}"
# 	do
# 		for k in "${WINDOW[@]}"
# 		do
# 			echo "./run_network_scenario_1.sh ${i} ${j} ${k} 9999 1 2"
# 		done	
# 	done		
# done
PROB=$1
TIMEOUT=$2
WINDOW=$3
SERVER=$4
C1=$5
C2=$6

echo "Starting Server..."
HOME_DIR=$(pwd)
cd server 
python3 server_udp.py -b $PROB -t $TIMEOUT -p $SERVER > server_$PROB_$TIMEOUT_$TIMEOUT_$SERVER.log  &
pid_server=$! 
sleep 2
cd ${HOME_DIR}"/clients"
echo $(pwd)
echo "Starting Client..."
python3 client_udp.py -i $C1 -w $WINDOW -f file1Gb.txt -s $SERVER > "client_$C1.log" &
pid_c1=$! 
python3 client_udp.py -i $C2 -w $WINDOW -f file1Gb.txt -s $SERVER > "client_$C2.log" &    
pid_c2=$!
wait $pid_c1
wait $pid_c2
echo "done.."
kill -9 ${pid_server}


