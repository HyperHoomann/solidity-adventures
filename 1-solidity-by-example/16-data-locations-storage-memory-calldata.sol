// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
The location of data can be explicitly specified when declaring variables:
3 data locations are:
    |-----------|-------------------|-------------------|-------------------------------------------|
    | name      | used for          | storage location  | remarks                                   |
    |-----------|-------------------|-------------------|-------------------------------------------|
    |`storage`  | state variable    | on blockchain     |                                           |  
    |`memory`   | function variable | in memory         | exists while function is being called     |
    |`calldata` | function arguments| special location) | only available for `external` functions.  |
    |-----------|-------------------|-------------------|-------------------------------------------|
*/

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];

        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    // Can take storage variables as input arguments
    // If arguments are from storage, in remix: it wont show fields + allow to pass values 
    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // TODO: What does "internal" function mean?
        // do something with storage variables
    }

    // Can also return memory variables
    function g(uint[] memory _arr)  public returns (uint[] memory) {
        // TODO: what does it mean by passing in memory variables as input/output
        // do something with memory array
    }

    // can take calldata as input arguments
    function h(uint[] calldata _arr) external {
        //do something with calldata array
    }

}