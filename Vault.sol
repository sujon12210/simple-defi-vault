// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC4626} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.0/contracts/token/ERC20/extensions/ERC4626.sol";
import {ERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.0/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.0/contracts/token/ERC20/IERC20.sol";

/**
 * @title SimpleVault
 * @dev A standard ERC-4626 vault implementation for yield-bearing assets.
 */
contract SimpleVault is ERC4626 {
    /**
     * @param asset The underlying token address (e.g., USDC).
     * @param name Name of the vault share token.
     * @param symbol Symbol of the vault share token.
     */
    constructor(
        IERC20 asset,
        string memory name,
        string memory symbol
    ) ERC20(name, symbol) ERC4626(asset) {}

    /**
     * @dev Function to simulate yield generation for testing purposes.
     * In production, this would be replaced by strategies interacting with external protocols.
     * @param amount The amount of underlying assets to "donate" to the vault.
     */
    function distributeYield(uint256 amount) external {
        SafeERC20.safeTransferFrom(IERC20(asset()), msg.sender, address(this), amount);
    }
}
