// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract Gas {
    /*
    Gas => unit of computation
        gas spent = gas used in a transaction
        gas price = Eth to be paid per gas
    
    total payment = gas spent * gas price

    Higher gas price == Higher priority to be included in block
    */

    uint public i = 0;
    
    function forever() public {
        /*
        If you use up all of the gas you send => 
            - Transaction fails
                - State changes are undone.
                - Gas spent not refunded.
        Eg - running an infinite loop will use up all gas
                and then transaction fails
        */
        while (true) {
            i += 1;
        }

    }

    /*
    Upper bounds to gas spend
        - gas limit:
            - set by us
            - max amount of gas we are willing ot use for transaction
        - block gas limit:
            - set by network
            - max amount of gas allowed in a block
    */
}