pragma solidity >=0.7.0 <0.9.0;

contract SimpleAuction {
    address payable beneficiary;
    uint public auctionEndTime;

    uint public highestBid;
    bool ended = false;
    address public highestBidder;

    mapping (address => uint) public pendingReturns;

    event highestBidIncrease(address bider, uint amount);
    event auctionEnded(address winner, uint amount);

    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() public payable {
        if (block.timestamp > auctionEndTime) {
            revert("Action was end");
        }

        if (msg.value < highestBid) {
            revert("Bid amount is not enough!");
        }

        highestBidder = msg.sender;
        highestBid = msg.value;

        if (highestBid != 0) {
            pendingReturns[highestBidder] = highestBid;
        }

        emit highestBidIncrease(msg.sender, msg.value);
    }

    function withdraw() public returns(bool) {
        uint amount = pendingReturns[msg.sender];

        if (amount > 0) {
            pendingReturns[msg.sender] = 0;
            if (!payable(msg.sender).send(amount)) {
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    function actionEnd() public {
        if (ended) {
            revert("Auction can be ended now!");
        }

        if (block.timestamp < auctionEndTime) {
            revert("Auction is not end yet");
        }

        ended = true;

        emit auctionEnded(highestBidder, highestBid);

        beneficiary.transfer(highestBid);
    }
}