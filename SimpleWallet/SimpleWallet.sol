// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Allowance is Ownable{
    mapping(address => uint) public allowance;

    function addAllowance(address _who, uint _amount) public {
        allowance[_who] = _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }

    function isOwner() public view returns (bool) {
        return owner() == msg.sender;
    }

    function reduceAllowance(address _who, uint _amount) internal {
        allowance[_who] -= _amount;
    }

}
// Extend allowance
contract SimpleWallet is Allowance {

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stores in the smart contract");
        if (!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        _to.transfer(_amount);
    }

    fallback() external payable {
        
    }

    receive() external payable {
        // custom function code
    }
}