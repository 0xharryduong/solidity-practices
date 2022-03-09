pragma solidity >=0.7.0 <0.9.0;

contract QuickCoin {
    address public minter;
    mapping(address => uint) public balances;

    event sent(address from, address to, uint amount);

    modifier onlyMinter {
        require(msg.sender == minter);
        _;
    }

    modifier checkAmount(uint amount) {
        require(amount < 1e60);
        _;
    }

    modifier checkBalance(uint amount) {
        require(amount <= balances[msg.sender], "Insufficient funds");
        _;
    }

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public onlyMinter checkAmount(amount) {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public checkBalance(amount) {
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit sent(msg.sender, receiver, amount);
    }
}