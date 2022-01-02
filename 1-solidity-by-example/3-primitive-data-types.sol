// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract Primitives {
    bool public boo = true;

    /* 
    uint = unsigned int, non negative integers
        uint8 => 0 to 2**8 - 1
        uint16
        ...
        uint256 => 0 to 2**256 - 1
        
        default is always largest size
            uint == uint256 
    */

    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123;

    /*
    int = Non negative numbers are allowed
        int8 => -2**8  to 2**8 - 1
        int16
        ...
        int256

        default int is int256
    */

    int8 public i8 = -1;
    int public i256 = -100;

    // Min and max 
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    int public minInt8 = type(int8).min;
    int public maxInt8 = type(int8).max;

    int public minInt256 = type(int256).min;
    int public maxInt256 = type(int256).max;

    // Adress = 20 byte long  (40 hex characters)
    // Random address from etherscan
    address public addr = 0x977dc06b51E14277a5ac047B44c78DBCc60A372B;
    
    // byte = array of bytes (byte[])
    bytes1 a = 0xb5;

    // Default values
    bool public defaultBool;    // false
    uint public defaultUint;    // 0
    int public defaultInt;      // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}