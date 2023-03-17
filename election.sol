// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract Election {  

    struct Contestant {
        uint id;
        string name;
        uint voteCount;
        string party;
        uint age;
        string qualification;
    }
    struct Voter {
        bool hasVoted;
        uint vote;
        bool isRegistered;
    }
    address admin;
    mapping(uint => Contestant) public contestants;
    mapping(address => Voter) public voters;
    uint public contestantsCount;
    modifier onlyAdmin(){
        require(msg.sender == admin);
        _;
    }
    constructor(){
        admin = msg.sender;
    }
    function addContestant(string memory _name , string memory _party , uint _age , string memory _qualification) public onlyAdmin {
        contestantsCount++;
        contestants[contestantsCount]=Contestant(contestantsCount, _name, 0, _party, _age, _qualification);
    }
    function voterRegisteration(address user) public onlyAdmin {
        voters[user].isRegistered = true;
    }
    function vote(uint _contestantId) public {
        require(voters[msg.sender].isRegistered, "Not Registered");
        require(!voters[msg.sender].hasVoted, "Already voted.");
        require(_contestantId > 0 && _contestantId <= contestantsCount);
        contestants[_contestantId].voteCount++;
        voters[msg.sender].hasVoted = true;
        voters[msg.sender].vote = _contestantId;
    }
}

