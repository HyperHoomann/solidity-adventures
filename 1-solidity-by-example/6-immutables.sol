// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract Immutables {
    // names are uppercased for Immutables too
    address public immutable MY_ADDRESS;
    uint public immutable MY_AMOUNT;

    /* 
    Immutables are like constants.
    Similarity: Once declared cannot be changed
    Difference: 
        - Value of immutable can be set inside constructor
            - when contract is first executed on the blockchain
    */

    constructor(uint _myAmount) {
        MY_ADDRESS = msg.sender;
        MY_AMOUNT = _myAmount;
    }
}