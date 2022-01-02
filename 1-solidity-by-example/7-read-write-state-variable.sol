// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract SimpleStorage {
    // A state variable to store a number
    uint public num;

    // To read a state variable - NON NEED to send a transaction
    function get() public view returns (uint) {
        return num;
    }

    // To write to a state variable - NEED to send a transaction
    function set(uint _num) public {
        num = _num;
    }
}