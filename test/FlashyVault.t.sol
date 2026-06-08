// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {FlashyVault} from "../contracts/vulnerable-examples/FlashyVault.sol";

contract FlashyVaultTest is Test {
    FlashyVault public vault;

    event RainbowDeposit(address indexed user, uint256 amount, string effect);
    event RainbowWithdraw(address indexed user, uint256 amount, string status);

    function setUp() public {
        vault = new FlashyVault();
    }

    function testDepositEmitsRainbowDeposit() public {
        vm.expectEmit(true, true, false, true);
        emit RainbowDeposit(address(this), 2 ether, "✨ Depósito recibido, brillo activado ✨");

        vault.deposit{value: 2 ether}();

        assertEq(vault.balances(address(this)), 2 ether);
        assertEq(vault.vaultMood(), "Brilla");
    }

    function testWithdrawEmitsRainbowWithdraw() public {
        vault.deposit{value: 1 ether}();

        vm.expectEmit(true, true, false, true);
        emit RainbowWithdraw(address(this), 1 ether, "🌈 Retiro seguro ejecutado");

        vault.withdraw(1 ether);

        assertEq(vault.balances(address(this)), 0);
        assertEq(vault.vaultMood(), "Dormido");
    }

    function testVaultMoodChangesCorrectly() public {
        assertEq(vault.vaultMood(), "Dormido");
        vault.deposit{value: 0.5 ether}();
        assertEq(vault.vaultMood(), "Luz tenue");
        vault.deposit{value: 1 ether}();
        assertEq(vault.vaultMood(), "Brilla");
    }
}
