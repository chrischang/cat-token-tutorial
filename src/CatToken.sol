// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title CatToken
 * @dev This contract is created as an example for Monad documentation
 * to demonstrate how to deploy a smart contract and index its onchain events
 * using GhostGraph.
 *
 * Visit: https://tryghost.xyz for information about GhostGraph
 *
 * GhostGraph can index the following events:
 * - Transfer events for token movements
 */

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CatToken is ERC20 {
    /**
     * @dev Constructor that gives msg.sender all existing tokens.
     * Initial supply is 1 billion tokens.
     */
    constructor() ERC20("CatToken", "CAT") {
        // Mint initial supply of 1 billion tokens to deployer
        // This will emit a Transfer event that GhostGraph   can index
        _mint(msg.sender, 1_000_000_000 * 10 ** decimals());
    }
}