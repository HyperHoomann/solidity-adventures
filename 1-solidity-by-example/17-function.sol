// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Functions
- similar to functions in most languages
- certain ways to return outputs from a function.

NOTE: 'public' functions cannot accept certain type of input and outputs
*/

contract Function {
    /* Functions can return multiple values*/
    function returnMany() public pure returns (uint, bool, uint) {
        return (1,true, 2);
    }

    // Return values can be named
    function returnNamed() public pure returns (uint x, bool b, uint y) {
        return (2, true, 4);
    }

    // If return value names and variable names are same, return statement can be ommited
    function returnOmitted() public pure returns (uint x, bool b, uint y) {
        x = 3;
        b = true;
        y = 6;
    }

    // Destructuring assignment, similar to python/js unpacking multiple return values from function
    function unpackMany() public pure returns (uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany();

        // some return values can be ignored if not needed
        (uint p, , uint q) = (4, 5, 6);

        return (i, b, j, p, q);
    }

    // NOTE: Map cannot be used for NEITHER input NOR output

    // NOTE: Array can be used for BOTH input and output
    function arrayInput(uint[] memory _arr) public pure returns(uint){
        if (_arr.length > 0){
            return _arr[0];
        }
        return 0;
    }

    uint[] public arr = [1,2,3,4];
    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }

}