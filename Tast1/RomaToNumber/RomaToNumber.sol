// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomaToNumber {

    mapping (string => uint) public romanValues ;

    constructor() {
        romanValues["I"] =1;
        romanValues["V"] =5;
        romanValues["X"] =10;
        romanValues["L"] =50;
        romanValues["C"] =100;
        romanValues["D"] =500;
        romanValues["M"] =1000;
    }
    
    function romaToNumber(string memory input) public view returns (uint){
            uint number = 0;    
            bytes  memory strBytes = bytes(input)  ;
            uint size = strBytes.length ;
            bytes1 lastHaft = 0;
           
            for (uint i = 0; i < size ;i++ ){
                bytes1 indexB =strBytes[i];

                // if(indexB =="I") {
                //     number+=1;
                // }
                // else if(indexB =="V"){
                //     number+=5;
                //     if(lastHaft =="I") {
                //         number-=2;
                //     }
                // }
                // else if(indexB =="X") {
                //     number+=10;
                //      if(lastHaft =="I") {
                //         number-=2;
                //     }
                // }
                // else if(indexB =="L") {
                //     number+=50;
                //      if(lastHaft =="x") {
                //         number-=20;
                //     }
                // }
                // else if(indexB =="C") {
                //     number+=100;
                //      if(lastHaft =="x") {
                //         number-=20;
                //     }
                // }
                // else if(indexB =="D") {
                //     number+=500;
                //      if(lastHaft =="C") {
                //         number-=200;
                //     }
                // }
                // else {
                //     number+=1000;
                //      if(lastHaft =="C") {
                //         number-=200;
                //     }
                // }

                number+=romanValues[transBytes1ToString(indexB)];
                if(lastHaft =='I' && (indexB == "V" ||indexB =="X")) {
                    number-=2;
                }
                if(lastHaft =='X' && (indexB=="L" || indexB =="C")){
                    number-=20; 
                }
                if(lastHaft =='C' && (indexB=="D" ||indexB =="M")){
                    number-=200; 
                }
                lastHaft=indexB;
            }
            return number;
    }

    function transBytes1ToString(bytes1 input) private pure returns (string memory) {
        bytes memory inputBytes = new bytes(1);
        inputBytes[0] = input;
        return string(inputBytes);
    }


    
}