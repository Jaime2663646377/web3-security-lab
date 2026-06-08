pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../contracts/vulnerable-examples/Vulnerable.sol";
import "../contracts/vulnerable-examples/Attacker.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();

        Vulnerable vulnerable = new Vulnerable();

        Attacker attacker = new Attacker(address(vulnerable));

        vm.stopBroadcast();
    }
}
