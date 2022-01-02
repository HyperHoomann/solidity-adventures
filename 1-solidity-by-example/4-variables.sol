// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract Variables {
    /* 
    State Variables
        - are stored on blockchain
        - declared outside a function
    */
    string public text = "HyperHoomann";
    uint public num = 123;

    function doSomething() public {
        /* 
        Local variables:
            - not stored on blockchain
            - declared inside a function
        */
        uint i = 456;

        /*
        Global variables:
            - provides information about the blochain
        */
        uint gaslimit = block.gaslimit;     // Current block gaslimit
        uint timestamp = block.timestamp;   // Current block timestamp
        uint number = block.number;         // Current block number

        address sender = msg.sender;      // Address of caller
    }
}