pragma solidity >=0.7.0 <0.9.0;

contract Game {
    
    uint public countPlayer;
    // Player[] public players;
    mapping(address => Player) public players;
    enum Level {Beginer, Intermediate, Advande}

    struct Player {
        address addressPlayer;
        string fullname;
        Level playerLevel;
        uint age;
        string sex;
        uint createTime;
    }

    function addPlayer(string memory fullName, uint age, string memory sex) public {
        players[msg.sender] = Player(msg.sender, fullName, Level.Beginer, age, sex, block.timestamp);
        countPlayer += 1;
    }

    function getPlayerLevel(address addressPayer) public view returns (Level) {
        return players[addressPayer].playerLevel;
    }

    function changePayerLevel(address playerAddress) public {
        Player storage player = players[playerAddress];
        if (block.timestamp >= player.createTime + 20) {
            player.playerLevel = Level.Intermediate;
        }
    }
}