// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract ExampleViewPure{
    uint public myStorageVariable;
    function getMyStorageVariable() public view  returns(uint){
        return myStorageVariable;
    }// hàm view thì chỉ có thể đọc và trả về, không thể ghi hoặc thay đổi giá trị các biến trong hợp đồng.
    //Có thể được gọi từ bên ngoài hợp đồng hoặc một hợp đồng khác.
    function getAddition(uint a, uint b) public pure returns(uint) {
        return a+b;
    }// hàm pure nó không đọc hoặc ghi được vào các biến của smartcontract, nó chỉ tính toán các biến truyền vào không liên quan đến hợp đồng.
    //và hàm pure tiêu tốn phí gas rất ít
    function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar;
        return _newVar;
    }//trường hợp return này dùng cho các hợp đồng khác.
}