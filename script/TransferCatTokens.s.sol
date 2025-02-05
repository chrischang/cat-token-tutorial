// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/CatToken.sol";

contract TransferCatTokens is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address token = vm.envAddress("TOKEN_ADDRESS");

        vm.startBroadcast(deployerPrivateKey);

        // Send tokens to test addresses
        CatToken(token).transfer(address(0x1), 1000 * 10**18);
        CatToken(token).transfer(address(0x2), 2000 * 10**18);
        CatToken(token).transfer(address(0x3), 3000 * 10**18);

        vm.stopBroadcast();
    }
}