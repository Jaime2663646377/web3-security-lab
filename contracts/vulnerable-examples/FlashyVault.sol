// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FlashyVault {
    mapping(address => uint256) public balances;
    bool private locked;

    event RainbowDeposit(address indexed user, uint256 amount, string effect);
    event RainbowWithdraw(address indexed user, uint256 amount, string status);
    event FlashyAlert(address indexed user, string message, uint256 totalBalance);

    modifier noReentrant() {
        require(!locked, "FlashyVault: reentrant attempt");
        locked = true;
        _;
        locked = false;
    }

    function deposit() public payable {
        require(msg.value > 0, "FlashyVault: need ETH to light up");
        balances[msg.sender] += msg.value;
        emit RainbowDeposit(msg.sender, msg.value, "✨ Depósito recibido, brillo activado ✨");

        if (address(this).balance >= 5 ether) {
            emit FlashyAlert(msg.sender, "¡El cofre está lleno de energía!", address(this).balance);
        }
    }

    function withdraw(uint256 amount) public noReentrant {
        require(amount > 0, "FlashyVault: amount must be positive");
        require(balances[msg.sender] >= amount, "FlashyVault: saldo insuficiente");

        balances[msg.sender] -= amount;
        emit RainbowWithdraw(msg.sender, amount, "🌈 Retiro seguro ejecutado");

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "FlashyVault: transfer failed");
    }

    function vaultMood() public view returns (string memory) {
        uint256 bal = address(this).balance;

        if (bal == 0) {
            return "Dormido";
        } else if (bal < 1 ether) {
            return "Luz tenue";
        } else if (bal < 5 ether) {
            return "Brilla";
        }

        return "Explosión de arcoíris";
    }
}
