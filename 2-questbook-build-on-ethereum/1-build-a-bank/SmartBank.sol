// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartBank {
    uint totalContractBalance = 0;

    function getContractBalance() public returns(uint) {
        return totalContractBalance;
    }
}