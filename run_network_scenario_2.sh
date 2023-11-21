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

C3=$7
C4=$8

C5=$9
C6=${10}

C7=${11}
C8=${12}

C9=${13}
C10=${14}


echo "Starting Server..."
HOME_DIR=$(pwd)
cd server 
python3 server_udp.py -b $PROB -t $TIMEOUT -p $SERVER > server_$PROB_$TIMEOUT_$TIMEOUT_$SERVER.log  &
pid_server=$! 
sleep 2
cd ${HOME_DIR}"/clients"
echo $(pwd)
echo "Starting Client..."

python3 client_udp.py -i $C1 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C1.log" &
pid_c1=$! 
sleep 1
echo "Started Client... $C1"

python3 client_udp.py -i $C2 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C2.log" &    
pid_c2=$!
sleep 1
echo "Started Client... $C2"

python3 client_udp.py -i $C3 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C3.log" &
pid_c3=$! 
sleep 1
echo "Started Client... $C3"

python3 client_udp.py -i $C4 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C4.log" &    
pid_c4=$!
sleep 1
echo "Started Client... $C4"


python3 client_udp.py -i $C5 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C5.log" &
pid_c5=$! 
sleep 1
echo "Started Client... $C5"

python3 client_udp.py -i $C6 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C6.log" &    
pid_c6=$!
sleep 1
echo "Started Client... $C6"

python3 client_udp.py -i $C7 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C7.log" &
pid_c7=$! 
sleep 1
echo "Started Client... $C7"

python3 client_udp.py -i $C8 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C8.log" &    
pid_c8=$!
sleep 1
echo "Started Client... $C8"

python3 client_udp.py -i $C9 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C9.log" &
pid_c9=$! 
sleep 1
echo "Started Client... $C9"

python3 client_udp.py -i $C10 -w $WINDOW -f file50Mb.txt -s $SERVER > "client_$C10.log" &    
pid_c10=$!
sleep 1
echo "Started Client... $C10"


wait $pid_c1
wait $pid_c2
wait $pid_c3
wait $pid_c4
wait $pid_c5
wait $pid_c6
wait $pid_c7
wait $pid_c8
wait $pid_c9
wait $pid_c10

echo "done.."
kill -9 ${pid_server}


