// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract ExampleUnt{
    uint256 public myUint;//0 - (2^256)-1
    uint8 public  myUint8 = 250;
    int public  myInt = -10; //-2^128 to 2^128-1
    function increementInt() public {
        myInt++;
    }
    function setMyUint (uint _myUint) public {
        myUint = _myUint;
    }
    function increementUint8() public {
        myUint8++;
    }

}