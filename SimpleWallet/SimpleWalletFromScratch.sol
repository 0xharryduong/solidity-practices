pragma solidity ^0.8.7;

contract SimpleWallet {

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not allowed");
        _;
    } 
    function withdrawMoney(address payable _to, uint _amount) public onlyOwner{
        _to.transfer(_amount);
    }


    fallback() external payable {
        
    }
}