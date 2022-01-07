// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Inheritance    
    - Contract inherist other contract by using "is" keyword.

    Multiple inheritance is supported by Solidity.
        - Order of inheritence is important.
        - Have to list from "most base-like" to "most derived".

    Special functions:
        - "virtual" = function going to be overridden by child contract
        - "override" = function going to override a parent function
*/


/* Graph of Inheritance
        A
       / \
      B   C
     / \ /
    F  D,E
*/

contract A {
    function foo() public pure virtual returns (string memory){
        return "A";
    }
}

// Contracts inhereit other contracts by using the keyword "is"
contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

/*
Contracts can inherit from multiple parent contracts.

NOTE: when a function is called that is defined in multiple parent contracts, 
        parent contracts are searched from RIGHT to LEFT, in depth-first manner;
        First contract that has the function is executed.
*/

contract D is B, C {
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
        // D.foo() returns "C" -> since C is rightmost parent with function foo.
    }
}

contract E is C, B {
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
        // E.foo() returns "B" -> since B is rightmost parent with function foo.
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
        //F.foo() returns "B" -> since B is rightmost parent with function foo
    }
}