// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedMappingExample {
    // Nested mapping declaration
    mapping(address => mapping(uint => string)) public  userMessages;

    // Function to set a message for a specific user and id
    function setMessage(address user, uint id, string memory message) public {
        userMessages[user][id] = message;
    }

    // Function to get a message for a specific user and id
    function getMessage(address user, uint id) public view returns (string memory) {
        return userMessages[user][id];
    }
}
