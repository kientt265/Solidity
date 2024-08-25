pragma solidity >=0.7.0 <0.9.0;
contract Auction{
    //Set money  - thoi gian con hoat dong  - Gia tri dat phai lon hon gia truoc(>0)
    //Rut tien  - Sau khi rut amount = bid - Sau khi rut bid =  0 
    //auctionEnd - Ket thuc phien dau gia - transfer sp va tien
    //Variable
    address payable public beneficiary;
    uint public auctionEndTime;
    uint public highestBid;
    address public highestBidder;
    bool ended = false;
    event auctionEnded(address winner, uint amount);
    mapping (address => uint) public pendingReturns;
    event higestBidincrease(address bidder, uint amount);
    
    constructor (uint _biddingTime, address payable _beneficiary){
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }
    
    //Function
    function bid() public payable{  //payble: lop bao mat thu 2
        if (block.timestamp > auctionEndTime){
            revert("End Auction!!!");
        }
        if(msg.value <= highestBid){
            revert("Value of you error!!!");
        }
        if(highestBid != 0){
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit higestBidincrease(msg.sender, msg.value);
    }
    
    function withdraw() public returns(bool){
        uint amount = pendingReturns[msg.sender];
        if(amount > 0){
            pendingReturns[msg.sender] = 0;
            if (!payable(msg.sender).send(amount)){
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }
    
    function auctionEnd() public {
        if(ended){
            revert("Auction Ended!!!");
        }
        if(block.timestamp < auctionEndTime){
            revert("Auction not Ended!!!");
        }
        ended = true;
        emit auctionEnded(highestBidder, highestBid);
        beneficiary.transfer(highestBid);
    }
}