// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Enum = enumerables

Useful for :
    - modelling choice (option 1, 2, 3, etc)
    - tracking state
Enum can de declared inside or outside of contract
*/

contract Enum {
    //Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    /* 
    Default value = first value listed in definition of the type
    In above Enum, default = Pending
    */

    Status public status;

    function getStatus() public view returns (Status) {
        /*
        When enum value is returned, it returns uint
            starting from 0
                Pending = 0
                Shipped = 1
                ...
        */
        return status;
    }

    function setStatus(Status _status) public {
        /*
        Update the state variable "status"        
        We set enum value by setting the correct uint value
            - uint should be passed as input.
        */
        status = _status;
    }

    function cancel() public {
        // Can update to a specific enum with dot notation.
        // eg - enum_name.value_name
        status = Status.Canceled;
    }

    function reset() public {
        // delete resets the enum to its first value, 0
        delete status;
    }
}


import "./utils/EnumDeclaration.sol";

contract ImportedEnum {
    ShipmentStatus public status;
}
