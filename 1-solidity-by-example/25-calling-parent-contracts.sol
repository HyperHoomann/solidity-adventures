// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
Parent contracts can be called in 2 ways:
    - directly,                 eg: A.foo()
    - using keyword "super",    eg: super.foo()

NOTE: by using "super" all of the immediate parent contracts will be called!
*/

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

contract A {
    // Events will be useful here for tracing function calls.
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C {    
    function foo() public override(B, C) {
        /* Outputs when D.foo():
            - Although D inherits A, B and C, it only called C and then A.
            - C.foo() doesnt call super, it directly calls A.foo(), so B wont be executed
        */
        super.foo();
    }

    function bar() public override(B, C) {
        /* Output when D.bar():
            - D called C, then B, and finally A.
            - Although super was called twice (by B and C) it only called A once.
        */
        super.bar();
    }
}