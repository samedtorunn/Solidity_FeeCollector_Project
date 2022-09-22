// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender; // sets the owner as the deployer adress.
    }

    receive() payable external {
        balance += msg.value; // Message value is represented in wei.
    }



    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owners can request withdraw");
        require(amount <= balance, "Funds are not sufficient");

        destAddr.transfer(amount);
        balance -= amount; // balance is decreased by the amount given.
    }
}
