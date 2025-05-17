// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vote {
    mapping(string => uint256) public votesMap;

    string[] public acounts;


    mapping(address => bool) public exists;

    function setVotes(string memory user) public {
    
        votesMap[user]++;

        for(uint i = 0;i < acounts.length;i++) {
            if ( keccak256(abi.encode(acounts[i])) ==  keccak256(abi.encode(user))) {
                return ;
            }
            
        }
        acounts.push(user);
        
    }

    function getVotes(string memory user) public view returns (uint256) {
        return votesMap[user];
    }

    function resetVoters() public {
        for(uint i=0;i<acounts.length;i++) {
            votesMap[acounts[i]]=0;
        }
    }
}
