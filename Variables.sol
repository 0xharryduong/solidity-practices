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

    string public myString = 'harry duong';

    // not like the other languagues, solidity is not made for really working with string or large string
    // working with string in solidity is expensive => need alot of gas => alot of ether for the fee
    function setMyString(string memory _myString) public { // when use string or others references type, must enter memory (store in memory)
        myString = _myString;
    }
}