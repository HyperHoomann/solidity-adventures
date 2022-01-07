// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Constructor = optional function that is executed upon contract creation

NOTE: Arguments can be passed to constructors
*/

// Base contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Base contract Y
contract Y {
    string public text;
    
    constructor(string memory _text) {
        text = _text;
    }
}

// 2 ways to initialize parent contract with parameters

// 1. pass the parameters in the inheritance list (hardcoded values)
contract B is X("Input to X"), Y("Input to Y") {

}

// 2. pass the parameters in the parent constructor definition (passed like modifiers)
contract C is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

/*
NOTE: Parent constructors are always called in order of inheritance
        regardless of order in which it is listed in constructor of child contract
*/

contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
    // Order of execution: Y, X, D
}

contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
    // Order of execution: Y, X, D
}