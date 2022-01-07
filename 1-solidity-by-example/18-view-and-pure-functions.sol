// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Getter functions can be declared `view` or `pure`
    - `view` = no state will be changed
    - `pure` = no state will be read/changed
*/

contract ViewAndPure {
    uint public x = 1;

    // "View" = Promise not to modify the state.
    function addTo(uint y) public view returns (uint) {
        return x + y;
    }

    // "Pure" = Promise not to modify or read from state.
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}