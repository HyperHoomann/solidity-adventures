// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
Functions and state variables fave to declare whether they are accessible by child/other contracts

- private - only the contract which defines the function can call
- internal - only inside contract that inherits an `internal` function
- public - any contract/account can call
- external - only other contracts/accounts can call


            Contract    Child Contract      External Contract
Private         Y               
INternal        Y               Y                  
Public          Y               Y                   Y
External                                            Y 

NOTE: External state variables do not exist.
*/

contract Base {
    // Private function can only be called
    //  - inside this contract
    // Contracts that inherit this function cannot call this function.
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        privateFunc();
    }

    /* Internal function can be called by
        - inside this contract
        - inside contracts that inherit this contract
    */
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        internalFunc();
    }

    /* Public function can be called
        - inside this contract
        - inside contract that inherit this contract
        - by other contracts and account
    */
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    /* External function can only be called
        - by other contracts and accounts
    */
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // NOTE: This function will not compile since we are trying to call an external function
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // State variables
    string private privateVar = "private variable text";
    string internal internalVar = "internal variable text";
    string public publicVar = "public variable text";
    // State variables cannot be external so this code below wont compile
    // string external externalVar = "external variable text";
}

contract Child is Base {
    // Inherited contracts donot have access to private functions and state vars
    // function testPrivateFunc() public pure returns (string memory) {
    //     privateFunc();
    // }

    // Internal functions can be called by child contracts.
    function testInternalFunc() public pure override returns (string memory) {
        internalFunc();
    }
}