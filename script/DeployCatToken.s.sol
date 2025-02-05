// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/CatToken.sol";

contract DeployCatToken is Script {
    function run() external {
        // Retrieve private key from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        CatToken token = new CatToken();
        vm.stopBroadcast();

        // Log the token address - this will be needed for GhostGraph indexing and submit transactions
        console.log("CatToken deployed to:", address(token));
    }
}