// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract ExampleMsgSender{
    address public  someAddress;
    function updateSomeAddress() public {
        someAddress = msg.sender;
    }
   
}