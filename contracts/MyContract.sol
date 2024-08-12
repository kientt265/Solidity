pragma solidity >=0.7.0 <0.9.0;
contract MyContract{
    uint public  savedata;

    function set(uint x) private  {
        savedata = x;

    }
    function get() public view returns (uint x) {
        return  savedata;
    }
}