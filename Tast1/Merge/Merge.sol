// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MergeNumbers{
    uint[] public  result;

    function mergerTwoGroups(uint[] memory group1,uint[] memory group2)public pure returns(uint[]memory) {
       

      uint[] memory merged = new uint[](group1.length+group2.length);

     uint i=0;
     uint j=0;
     uint k=0;

     while(i<group1.length && j<group2.length) {
        if(group1[i] <= group2[j]) {
            merged [k++] = group1[i++];
        } else {
            merged[k++] = group2[j++];
        }
     }

     while(i <group1.length) {
        merged[k++] = group1[i++];
     }
     while(j<group2.length) {
        merged[k++] = group2[j++];
     }
     
     return merged;
    }

}