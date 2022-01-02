// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract Constants {
    // names are uppercased for CONSTANT variables
    address public constant MY_ADDRESS = 0x977dc06b51E14277a5ac047B44c78DBCc60A372B;
    uint public constant MY_AMOUNT = 123;

    function getAddress() public returns (address){
        return MY_ADDRESS;
    }

    function getAmount() public returns (uint) {
        return MY_AMOUNT;
    }
}