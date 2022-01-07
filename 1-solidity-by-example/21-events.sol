// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Events
- allow logging to the Ethereum blockchain.

Use cases:
- listening for events and updating user interface
- cheap form of storage
*/

contract Event {
    /*
    Event declaration
    - upto 3 parameter can be indexed.
    - indexed parameters helps to filter the logs by indexed parameter
    */
    event Log(address indexed sender, string message);
    event AnotherLog();

    function testEvents() public {
        emit Log(msg.sender, "Hello world");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}