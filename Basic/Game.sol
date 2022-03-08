pragma solidity >=0.7.0 <0.9.0;

contract Game {
    
    uint public countPlayer;
    // Player[] public players;
    mapping(address => Player) public players;
    enum Level {Beginer, Intermediate, Advande}

    struct Player {
        address addressPlayer;
        string fullname;
        Level myLevel;
        uint age;
        string sex;
    }

    function addPlayer(string memory fullName, uint age, string memory sex) public {
        players[msg.sender] = Player(msg.sender, fullName, Level.Beginer, age, sex);
        countPlayer += 1;
    }

    function getPlayerLevel(address addressPayer) public view returns (Level) {
        return players[addressPayer].myLevel;
    }
}