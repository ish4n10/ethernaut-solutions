pragma solidity ^0.8;

interface MagicNum {
	function setSolver(address) external;
}

contract expl {
	
	MagicNum public chall = MagicNum(0x7A18D1A5a8B82d887E9bB0f5423032D8c229d5d6);

	function pwn() public {
    	bytes memory bytecode = hex"69602a60005260206000f3600052600a6016f3";
    	address solver;
          // use solidity assembly docs
          // handcraft a payload that returns 0x2a
    	assembly {
        	solver := create2(0, add(bytecode, 0x20), mload(bytecode), 0)
    	}

    	chall.setSolver(solver);
    }
}

