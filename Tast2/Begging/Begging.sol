// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/access/Ownable.sol";

contract BeggingContract is Ownable {

    mapping(address => uint256 amount) private  donateAmount;

    uint256 private totalAmount;

    constructor() Ownable(msg.sender){

    }

    receive() external payable { }

    function donate (address  user, uint256 amount) external payable  {
        require(user != address(0),"invalid user"); // Check if the user is valid
        payable(user).transfer(amount);
        donateAmount[user]+=amount;
    }

    function withdraw(uint256 amount) public onlyOwner {
        require (amount<=getBalance(), "Insufficient balance");  // Check if the sender has sufficient balance
        payable (msg.sender).transfer(amount);
    }

    function getDonation(address user) public view returns(uint256) {
        return donateAmount[user];
    }

    function getBalance() private view returns(uint256) {
        return address(this).balance;
    }


}