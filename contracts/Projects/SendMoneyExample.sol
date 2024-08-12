// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract SenWithdrawMoney{
    uint public  blanceReceived;
    function deposit() public payable {
        blanceReceived += msg.value;
    }
    function getContractBalance() public view  returns(uint) {
        return address(this).balance;
    }
    function withdrawAll() public {
        address payable  to = payable (msg.sender);
        to.transfer((getContractBalance()));

    }
    function withdrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }
}