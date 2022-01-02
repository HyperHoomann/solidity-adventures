// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract Loops {
    /* 
    NOTE: Don't write loops that are unbounded.
            as this can hit the gas limit,
             causing your transaction to fail.
    */

    function forloop() public pure returns (uint) {
        uint i;
        for (i=0; i < 10; i++) {
            if (i == 3) {
                // continue = skip to next iteration of loop
                continue;
            }

            if (i == 5) {
                // break = exit loop
                break;
            }
        }
        return i;
    }

    function whileloop() public pure returns (uint){
        uint j = 0;
        while (j< 10) {
            j++;
        }
        return j;
    }
}