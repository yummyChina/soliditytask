// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract NumberToRoma {

     bytes  public output ;
     string public result;

     uint public mm;
     uint public remain;

    function numberToRoma(uint  number) public  returns (string memory) {

    
        remain = number;
        uint M = number / 1000;
        mm = M;
        if(M>0) {
            for(uint i=0;i<M;i++) {
                output.push(bytes1("M"));
            }
            remain -=M *1000;
        }

        if(remain>=900) {
            output.push("C");
            output.push("M");
            remain-=900;
        }

        if(remain>=500) {
            output.push("D");
            remain-=500;
        }

        if(remain>=400) {
            output.push("C");
            output.push("D");
            remain -= 400;
        }

        uint C = remain/100;
        
        if(C>0) {
           for(uint i=0;i<C;i++)  output.push("C");
           remain -=100*C;
        }

        if(remain>=90) {
            output.push("X");
            output.push("C");
            remain -=90;
        }   

        if(remain>=50) {
            output.push("L");
            remain-= 50;
        }  

        if(remain>=40) {
            output.push("X");
            output.push("L");
            remain-= 40;
        }

        uint X = remain/10;

        if(X>0) {
           for(uint i=0;i<C;i++)  output.push("X");
           remain -=10*C;
        }

        if(remain>=9) {
            output.push("I");
            output.push("X");
            remain -=9;
        }

        if(remain>=5) {
            output.push("V");
            remain -=5;
        }

        if(remain>=4) {
            output.push("I");
            output.push("V");
            remain -=4;
        }

        for(uint i=0;i<remain;i++) {
            output.push("I");
        }

      result = string(output);

        return result;

    }
}