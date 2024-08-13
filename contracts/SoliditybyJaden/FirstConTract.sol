// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract FirstConTract{
        uint  saveData;
        function set(uint _x) public {
            saveData = _x;
        }
        function get() public  view returns(uint x){
            return saveData;
        }
}