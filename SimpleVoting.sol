// SPDX-License-Identifier:MIT

pragma solidity ^0.8.17;
contract SimpleVote{
    address public owner;

   struct Voter {
    bool hasVoted;
    bool voteChoice;
}
  mapping(address => Voter) public voters;

  constructor(){
    owner = msg.sender;
  }
  modifier onlyOwner() {
    require(msg.sender == owner, "NOT OWNER");
    _;
  }

    event Voted(address voter, bool choice);

    uint public yesVotes;
    uint public noVotes;

    function vote(bool _voteYes) public {
        
        require(!voters[msg.sender].hasVoted, "Already voted");
       if (_voteYes) {
    yesVotes++;
} else {
    noVotes++;
}
       voters[msg.sender] = Voter(true, _voteYes);

    emit Voted(msg.sender, _voteYes);  
    }
   function getResult() public view returns (string memory){
    if (yesVotes > noVotes) {
        return "Yes is winning";
    } else if (noVotes > yesVotes) {
        return "No is winning";
    } else {
        return "Draw";
    }
}
     function getMyVote() public view returns (bool){
        return voters[msg.sender].voteChoice;
        
    
     }
     function hasUserVoted() public view returns (bool){
     return voters[msg.sender].hasVoted;
     }
     function resetVotes() public onlyOwner{
        yesVotes = 0;
        noVotes = 0;
     }
   
    }