// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {FlashyVault} from "../contracts/vulnerable-examples/FlashyVault.sol";

contract FlashyDemoScript is Script {
    function run() external {
        vm.startBroadcast();

        FlashyVault vault = new FlashyVault();
        vault.deposit{value: 1 ether}();

        vm.stopBroadcast();
    }
}
