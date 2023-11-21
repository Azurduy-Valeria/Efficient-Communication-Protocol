##Implementation of an efficient many to many communication protocol over UDP
This implementation is mainly done with Python(the server and the client), however we use a bash script in order to run it with many clients. 

To run this program you would use the following command:
For the scenario 1:
./run_network_scenario_1.sh 0.05 0.1 2 9991 1 2

For the scenario 2:
./run_network_scenario_2.sh 0.05 0.1 2 9501 41 42 43 44 45 46 47 48 49 50

Note that the data of 1G.txt or 10Mb.txt is not added since it could be too heavy to send.
