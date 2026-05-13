// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Vulnerable.sol";
import "../src/Secure.sol";

contract ReentrancyTest is Test {

    Vulnerable vulnerable;
    Secure secure;

    function setUp() public {
        vulnerable = new Vulnerable();
        secure = new Secure();
    }

    function testDepositVulnerable() public {
        vulnerable.deposit{value: 1 ether}();
        assertEq(address(vulnerable).balance, 1 ether);
    }

    function testDepositSecure() public {
        secure.deposit{value: 1 ether}();
        assertEq(address(secure).balance, 1 ether);
    }

    function testFinalBalanceSecure() public {
        secure.deposit{value: 1 ether}();

        secure.withdraw();

        assertEq(address(secure).balance, 0);
    }
}
