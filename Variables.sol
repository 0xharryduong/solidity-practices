pragma solidity ^0.8.7;

contract WorkingWithVariables {
    uint256 public myUint;

    function setMyUnit(uint _myUint) public {
        myUint = _myUint;
    }
}