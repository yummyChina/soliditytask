// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC20 is ERC20,Ownable {

    mapping(address account => uint256) private _balances;

    mapping(address account => mapping(address spender => uint256)) private _allowances;


    constructor() ERC20 ("MyERC20","MTK") Ownable(address(this)) {

    }

    receive() external payable { }

    function balanceOf(address account) public view  override returns (uint256 _amount){
        return _balances[account];
    }

    function transfer(address to, uint value) public override  returns(bool) {
        if (msg.sender == address(0)) {
            revert ERC20InvalidSender(address(0));
        }
        if (to == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        address from = msg.sender;
        uint256 fromBalance = _balances[from];
        _balances[from] = fromBalance - value;
        emit Transfer(from, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public override  returns(bool) {
        address owner = msg.sender;
         _allowances[owner][spender] = value;
         emit Approval(owner, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public override  returns(bool) {
        address spender = msg.sender;
        uint256 currentAllowance =  _allowances[from][spender];
        if (currentAllowance < type(uint256).max) {
            uint256 fromBalance = _balances[from];
           _balances[from] = fromBalance - value;
           _balances[to] += value;
        }
        return  true;
    }
   
    function mint(address to,uint256 amout) public onlyOwner {
        _mint(to,amout);
    }
    
}