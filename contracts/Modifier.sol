pragma solidity >=0.7.0 <0.9.0;
contract FirstCoin{
    address public minter;
    mapping (address => uint ) public  balances;
    event sent(address from, address to, uint amount);
    modifier onlyMinter  {
        require(msg.sender == minter );
        _;//goi moi chay
    }
    modifier checkAmount(uint amount) {
        require(amount < 1e60);
        _;
    }
    modifier  checkBalances(uint amount){
         require(amount<balances[msg.sender], "Khong the chuyen tien");
         _;
    }
    constructor () {
        minter = msg.sender;
    }

    function mint(address receiver , uint amount ) public onlyMinter checkAmount(amount)  {      
        balances[receiver] += amount;
    }
    function send(address receiver, uint amount) public checkBalances(amount) {
       
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit sent(msg.sender, receiver, amount);
    }
}

