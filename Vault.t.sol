// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Vault.sol";
import {ERC20} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.0/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("Mock Asset", "MOCK") {
        _mint(msg.sender, 1000000 * 10**18);
    }
}

contract VaultTest is Test {
    SimpleVault public vault;
    MockERC20 public asset;
    address user = address(1);

    function setUp() public {
        asset = new MockERC20();
        vault = new SimpleVault(asset, "Vault Share", "vSHR");
        asset.transfer(user, 1000 * 10**18);
    }

    function testDeposit() public {
        vm.startPrank(user);
        asset.approve(address(vault), 100 * 10**18);
        vault.deposit(100 * 10**18, user);
        vm.stopPrank();

        assertEq(vault.balanceOf(user), 100 * 10**18);
        assertEq(asset.balanceOf(address(vault)), 100 * 10**18);
    }

    function testWithdrawal() public {
        vm.startPrank(user);
        asset.approve(address(vault), 100 * 10**18);
        vault.deposit(100 * 10**18, user);
        
        vault.withdraw(100 * 10**18, user, user);
        vm.stopPrank();

        assertEq(vault.balanceOf(user), 0);
        assertEq(asset.balanceOf(user), 1000 * 10**18);
    }
}
