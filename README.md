# Quorum 7Nodes Smart Contract Deployment

**Smart contract : Simple Voting Application**
  - This contract will create contestants and voters.
  - Voters will cast their votes to their favourite contestant.

**Steps**
1. Quorum 7nodes setup
    - Run command `git clone https://github.com/jpmorganchase/quorum-examples.git` to clone the quorum-examples repository. 
    - Now go to quorum-examples folder using command `cd quorum-examples`
    - Quorum Network is by default created using Istanbul BFT consensus. In order to change consensus configuration to Raft, we need to run the command `QUORUM_CONSENSUS=raft`
    - We can even reduce the number of nodes if we have low system configuration. Just we need to go to the file `examples/7nodes/permissioned-nodes.json` and delete the nodes encodes address.
    - Now run command `sudo docker-compose up -d` to start the docker container in background with 7nodes running.
    - Also We can run command `docker ps` to check the status of each of the 7 nodes. Wait till the status of nodes and transactions become healthy. 
2. Deploying Smart contract
    - For Deploying smart contract on any node, we need to enter into geth javascript console of particular node. Run command `sudo docker exec -it quorum-examples_node1_1 geth attach /qdata/dd/geth.ipc` to enter into console of particular node (node1 in the above command).
    - Now we are in geth console of node1. Run javascript file `private-contract.js` that deploys our smart contract on node1. private-contract.js file contains abi and bytecode of our smart contract. Also we can change privateFor field in private-contract.js to choose the node with which we want to make the transcations private. If we don't want to make transaction private to any node, we can make privateFor field as [] (i.e. empty). Run command `loadScript('/examples/private-contract.js')` to deploy smart contract. This will return transaction hash and contract address. 
   
**Output**


![plot](/home/shrawan/Pictures/Screenshots/Screenshot from 2023-03-17 22-44-00.png)
