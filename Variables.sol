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

    uint8 public myUnint8;

    function incrementUnit() public {
        myUnint8++;
    }

    function decrementUnit() public {
        myUnint8--;
    }

    address myAdress;

    function setAddress(address _address) public {
        myAdress = _address;
    }

    function getBalanceOfAddress() public view returns(uint) {
        return myAdress.balance;
    }
}