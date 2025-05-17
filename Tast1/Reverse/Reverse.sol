// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseStr{
    function reverseString(string memory input) public pure returns (string memory) {
       bytes memory strBytes = bytes(input);
       uint256 length = strBytes.length;
       
       for(uint256 i=0;i<length/2;i++) {
            bytes1 temp = strBytes[i] ;
            strBytes[i] = strBytes[length-i-1];
            strBytes[length-i-1] = temp;
       }
       return string(strBytes);
    }
}