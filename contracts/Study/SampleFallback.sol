// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract SampleFallback{
    uint public lastValueSent;
    string public lastFunctioncalled;
    uint public  myUint;
    function setMyUint(uint _myNewUint) public {
        myUint = _myNewUint;
    }
    receive() external payable { 
        lastValueSent = msg.value;
        lastFunctioncalled = "receive";
    } //chỉ có thể dựa vào 2300gas
    fallback() external payable {
        lastValueSent =msg.value;
        lastFunctioncalled = "fallback";
     } //chỉ có thể dựa vào 2300gas
}