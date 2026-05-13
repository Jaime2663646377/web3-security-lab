pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Vulnerable.sol";
import "../src/Attacker.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();

        Vulnerable vulnerable = new Vulnerable();

        Attacker attacker = new Attacker(address(vulnerable));

        vm.stopBroadcast();
    }
}
