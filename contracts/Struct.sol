pragma solidity >=0.7.0 <0.9.0;
contract Game{
    uint public countPlayer = 0;
    mapping (address => Player) public  players;
    enum Level {Beginner, Init, Advance}
    struct Player{
        address addressPlayer;
        string FullName;
        Level myLevel;
        uint age;
        string sex;
        uint createTime;
    }
    function addPlayer(string memory FullName, uint age, string memory sex) public {
        players[msg.sender] = (Player(msg.sender, FullName, Level.Advance, age, sex, block.timestamp));
        countPlayer += 1;
    }
    function getPlayerLevel(address addressPlayer ) public  returns (Level) {
        return players[addressPlayer].myLevel;
    }
    function changePlayerLevel(address addressPlayer) public {
        Player storage player = players[addressPlayer];
        if (block.timestamp >= player.createTime + 15) { 
            player.myLevel = Level.Init;
        }
    }
}