// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract IfElse {
    uint public x = 5;

    function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint _x) public pure returns (uint) {
        /*
        shorthand way to write if, else
            if (_x < 10) {
                return 1;
            } else {
                return 2;
            }
        */
            
        return _x < 10 ? 1: 2;
    }
}