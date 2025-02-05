# CatToken Tutorial

This tutorial demonstrates how to test and deploy a simple ERC20 token (Cat Token) on the Monad testnet. The token has a fixed supply of 1 billion tokens minted to the deployer's address upon creation.

This repository supplements [insert blog URL, let's add this after we publish the tutorials]. Refer to this blog to follow along and create a [GhostGraph](https://tryghost.xyz) to track for onchain events.

# ⚠️ IMPORTANT DISCLAIMER ⚠️

This tutorial and the accompanying CatToken implementation are PROVIDED STRICTLY FOR EDUCATIONAL PURPOSES ONLY.

## Educational Scope

This tutorial:
- Demonstrates the basic ERC20 token deployment process.
- Shows GhostGraph integration for onchain data tracking.
- Illustrates fundamental smart contract testing practices.
- Serves as a learning resource for blockchain developers.

## Intended Usage

This code is intended for:
- Learning and experimentation.
- Testing and development environments.
- Understanding blockchain concepts.
- Educational workshops and demonstrations.

**Warning**: Any use of this code in production environments or with real assets could result in significant financial losses. Always engage professional smart contract auditors and security experts before deploying contracts to mainnet.

## Token Implementation Details

The ERC20 token implementation includes:
- Fixed supply of 1 billion tokens.
- All tokens minted to the deployer upon creation.
- Standard ERC20 transfer and approval functionality.
- No additional minting capability.
- No special roles or permissions.

## Testing Instructions

Before deploying to the Monad testnet, verify the contract functionality:

```bash
forge test -vv
```

The `-vv` flag provides verbose output showing test details. The tests verify:
- Initial supply is correctly allocated to the deployer.
- Token transfers work as expected.
- Approval and transferFrom mechanisms function properly.

## Deployment Process

### 1. Environment Setup

Copy `.env.example` and name it `.env` and fill in your credentials:

```bash
cp .env.example .env
```

```bash
PRIVATE_KEY=your_private_key_here
MONAD_TESTNET_RPC=https://testnet-rpc.monad.xyz
TOKEN_ADDRESS=fill_this_in_later_after_deployment
```

### 2. Load Environment Variables

```bash
source .env
```

### 3. Deploy to Testnet

```bash
forge build && forge script script/DeployCatToken.s.sol \
    --rpc-url $MONAD_TESTNET_RPC \
    --broadcast
```

### 4. Submit Test Transactions

After deployment, add the contract address to your `.env`:

```bash
TOKEN_ADDRESS=your_token_address_here
```

Then execute transfer script:

```bash
forge build && forge script script/TransferCatTokens.s.sol \
    --rpc-url $MONAD_TESTNET_RPC \
    --broadcast
```

You should see three transactions being submitted onchain with three transfers.

## Deployment Verification

### Load Environment Variables

```bash
source .env
```

### Check Token Balance

```solidity
cast call $TOKEN_ADDRESS "balanceOf(address)(uint256)" $YOUR_ADDRESS --rpc-url $MONAD_TESTNET_RPC
```

### Verify Total Supply

```solidity
cast call $TOKEN_ADDRESS "totalSupply()(uint256)" --rpc-url $MONAD_TESTNET_RPC
```

## Event Monitoring

The contract emits standard ERC20 events:

```solidity
event Transfer(address indexed from, address indexed to, uint256 value);
```

## Troubleshooting Guide

If deployment fails, verify:
- Your MONAD test token balance is sufficient for gas.
- Private key configuration is correct.
- RPC URL is valid and responsive.
- You're within rate limits.

## License

This project is released under the MIT License.

## Questions?

Join [Ghost Devs Telegram Group](https://t.me/ghostlogsxyz)
