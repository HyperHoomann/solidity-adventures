// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Modifiers = code that can be run before/after a function call

Modifiers are used to:
- Restrict access
- Validate inputs
- guard against reentracy hack
*/

contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // set transaction sender as owner of contract
        owner = msg.sender;
    }

    // Modifier to check caller is owner of contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");

        /*
        Underscore is a special character used ONLY inside a function.
        It tells Solidity to execute the rest of the code.
        NOTE: In this case it executes the code of the function where this modifier is added
        */
        _;
    }

    // Modifiers can take inputs.
    // Modifier to check that address passed in is not default zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    // can add multiple modifiers to same function
    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    /*
    Modifiers can be added before and/or after  a function.
    This modifier prevents a functoin from being called while it is still executing.
        Sort of like a transaction lock.
    */
    modifier noReentrancy() {
        // Ensure that it is not already locked by another execution
        require(!locked, "No reentrancy");
        
        // Make it locked now
        locked = true;

        // Execute the function
        _;

        // Release the lock
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            // Try calling the function with 'noEntrancy' modifier again
            // Since lock is not released yet, it will throw "No reentrancy" error
            decrement(i-1);
        }
    }
}