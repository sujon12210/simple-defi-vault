# Simple DeFi Vault (ERC-4626)

This repository contains a high-quality implementation of a Tokenized Vault using the Ethereum standard ERC-4626. It is designed for developers looking to build yield aggregators, lending markets, or staking pools.

## Features
- **ERC-4626 Standard**: Ensures interoperability with other DeFi protocols.
- **Secure Accounting**: Handles share calculation and asset transfers with precision.
- **Foundry Optimized**: Ready for high-speed testing and deployment.
- **Zero Subfolders**: Flat structure for maximum readability.

## Quick Start
1. Install Foundry.
2. Run `forge build` to compile the contracts.
3. Run `forge test` to execute the vault accounting suite.

## Logic Overview
The vault accepts an underlying asset (e.g., WETH or USDC). When users deposit, the contract mints "shares" based on the current ratio of total assets to total shares.
