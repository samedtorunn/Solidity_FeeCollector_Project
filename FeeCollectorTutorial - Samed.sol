// SPDX-License-Identifier: MIT
pragma solidity 0.8.7; // solidity version is declared.

contract FeeCollector {
    address public owner; // this will be set as the contract owner's address later.
    uint256 public balance; // this will be defining the balance of the deposits.

    constructor() { // basic constructor function.
        owner = msg.sender; // sets the owner as the deployer adress.
    }

    receive() payable external { // this is payable since wei is transferred.
        balance += msg.value; // message value is represented in wei.
    }



    function withdraw(uint amount, address payable destAddr) public { // money withdrawal function. 
        require(msg.sender == owner, "Only owners can request withdraw"); // requirement and the error if the requirement does not satisfied.
        require(amount <= balance, "Funds are not sufficient"); // requirement and the error if the requirement does not satisfied.
        
        balance -= amount; // balance is decreased by the amount given.
        destAddr.transfer(amount); //amount gets transferred.

    }
}
