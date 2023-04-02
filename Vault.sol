// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
  bool public locked;
  bytes32 private password;
  
  // password = 0x412076657279207374726f6e67207365637265742070617373776f7264203a29 
  constructor(bytes32 _password) {
    locked = true;
    password = _password;
  }
  // private variables cannot be accessed through another contract,
  // but they can be accessed through web3.eth.getStorageAt(addr, idx):
  // where address is the address of contract
  // and idx is index of the storage variable in layout, 
  // here password is in index "1"
  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}
