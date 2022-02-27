pragma solidity ^0.5.13;

contract StartStopUpdateExample {

    address owner;

    bool public paused;

    constructor() public {
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "you are not the owner");
        paused = _paused;
    }

    function withdrawAllMoney(address payable _to) public {
        // in other languages, we may think about if else, but in solidity: 
        require(msg.sender == owner, "You are not the owner"); // check if the one that withdraw is owner (the one that send owner to contract) or not
        require(paused, "Contract is paused");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "you are not the owner");
        selfdestruct(_to);
    }
}