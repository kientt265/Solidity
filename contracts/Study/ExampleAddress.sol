// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract ExampleMyAdress{
    //Address được biểu diễn 20byte của một địa chỉ Ethereum hoặc 1 tk Ethereum
    address public someAdress;
    function setSomeAdress(address _someAdress) public {
        someAdress = _someAdress;
    }
    function getAddressBalance() public view returns(uint) {
        return someAdress.balance;
    }
} //1ETH = 10^18WEI; WEI là mệnh giá nhỏ nhất trên chuỗi khối Ethereum

