// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Errors
- if an error occurs during a transaction, 
    it will undo all changes made to the state during the transaction
3 ways to throw errors:
    - 'require' - used to validation before execution
            inputs 
            conditions 
            return values from other functions 
    - 'revert' - similar to revert, but for complex conditions
    - 'assert' - used to check code that should never be false. Failing assertion ~ bug
            Assert should only be used for testing internal errors

NOTE: use custom error to save gas
*/

contract Error {
    function testRequire (uint _i) public pure {
        require(_i > 10, "Input must be > 10");
    }

    function testRevert (uint _i) public pure {
        if (_i <= 10) {
            revert("Input must be > 10");
        }
    }

    uint public num;

    function testAssert () public view {
        // Here we assert that num has default value since its not updated
        assert(num == 0);
    }

    // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);
    
    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;   // TODO:what does "this" refer to here?
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}

contract Account {
    uint public balance;
    uint public constant MAX_UINT = 2**256 - 1;

    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        // balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;
        
        // Check there is balance to withdraw
        // i.e. balance - amount does not underflow
        require(balance >= _amount, "Underflow");

        //TODO: why is both require and revert required here?
        if (balance < _amount) {
            revert("Underflow");
        }
         
         balance -= _amount;

         assert(balance <= oldBalance);
    }
}