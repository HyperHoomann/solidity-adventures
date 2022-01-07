// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Unlike functions, state variables cannot be overridden by re-declaring it in the child contract.

Way to correctly override inherited state variables is by initializing them inside child contructors
*/

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

// Shadowing is disallowed in Solidity 0.6
// This will not compile
// contract B is A {
//     string public name = "Contract B";
// }

contract C is A {
    // This is the correct way to override inherited state variables.
    constructor() {
        name = "Contract C";
    }

    // C.getName returns "Contract C"
}
