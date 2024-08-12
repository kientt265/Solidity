// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
contract ExampleStrings{
    string public  myString = "Hello World!";
    bytes public myBytes = "Hello world!"; //Xuat ra chuoi byte
    //Byte thì có thể chuyển sang chuỗi và lấy độ dài
    //Nhưng chuỗi thì không, chuỗi được biểu diễn bằng UTF 8.
    //Điều này có nghĩa là đôi khi 1 kí tự được biểu diễn bằng một byte hoặc 2 bytes =>Nhận được độ dài không thực tế.
    //Vậy không nên sử dụng string trong smartcontract. Có thể sử dụng nó như một thông báo.
    function setMyStrings(string memory _myString) public {//memory là lưu trữ tạm thời, cho đến khi giao dịch kết thúc
        myString =_myString;
    }
    function compareTwoStrings(string memory _myString) public view returns(bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
        //Ở đây ta đang so sánh 2 chuỗi băm chứ không phải so sánh chuỗi.
    }
}   