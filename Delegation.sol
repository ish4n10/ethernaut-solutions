pragma solidity ^0.8.0;

contract Delegate {

  address public owner;

  constructor(address _owner) {
    owner = _owner;
  }

  function pwn() public { // this functions makes the caller the owner
    owner = msg.sender;
  }
}

// delegateCall -> call the "Delegate"'s function from "Delegation" contract using fallback 

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }
             // due to storage layout of solidity, when we call pwn() from this contract,
             // variables in the slot get changed as they are the same, hence when we become owner
             // of Delegate contract, we become the owner here.
  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}
