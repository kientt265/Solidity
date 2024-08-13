// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract DataType{
    // bool public  myBoolean = true;
    // uint myUnsignInteger = 10;
    // string myString = "MyString Hello!";
    // address myAddress = msg.sender;
    uint public countPlayer = 0;
    struct  Player{
            address addressPlayer;
            string FullName; 
            Level myLevel;
            uint age;
            string sex;
        }
    // Player[] public  players;
    mapping (address => Player) public players;
    enum Level {Beginner, Intermediate, Advance}
    function addPlayer(string memory _FullName, uint _age, string memory _sex) public {
        // players.push(Player(_FullName, _age, _sex));
        players[msg.sender] = Player(msg.sender, _FullName, Level.Beginner, _age,_sex);
        countPlayer++;
    }
    function getLevel(address addressPlayer) public returns(Level) {
        return players[addressPlayer].myLevel;
    }

    
}
