pragma solidity ^0.8.7;

contract WorkingWithVariables {
    uint256 public myUint;

    function setMyUnit(uint _myUint) public {
        myUint = _myUint;
    }

    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
}