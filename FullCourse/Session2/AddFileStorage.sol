// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";
//Nếu muốn thay đổi hàm khi từ contract cha qua contrac con
//Thì phải thêm virtual bên hàm cha và thêm overide bên hàm con
contract AddFiveStorage is SimpleStorage {
    function store(uint256 _number) public override {
        number = _number + 5;
    }
}