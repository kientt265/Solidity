// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Crowfunding{
error NoAvailableAmount();
uint256 public  constant MINIMUM_FUND = 0.1 ether;
address public  immutable i_owner;
receive() external  payable { 
    fund();
}
fallback() external payable { 
    fund();
}
constructor() {
    i_owner = msg.sender;
}
modifier onlyOwner() {
    if(msg.sender != i_owner) {
            revert NoAvailableAmount();
        }
     _;
}
    function fund() public  payable {
        require(msg.value >= MINIMUM_FUND, "no available amount!");
    }
    function withdraw() public payable onlyOwner {
        
        (bool sent, ) = payable(i_owner).call{value:address(this).balance}(" ");
        require(sent, "Failed to send Ether!");
    }
    function getBalance() public  view returns(uint256){
        return address(this).balance;
    }
}
