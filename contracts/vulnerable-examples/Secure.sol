// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Secure {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint amount = balances[msg.sender];
        require(amount > 0);

        balances[msg.sender] = 0;


        (bool success, ) = msg.sender.call{value: amount}("");
        require(success);
    }
}
