// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

/*
Maps are like dictionaries/associative arrays
    - Map between key and value
    - Are defined using types (for key and value)
Syntax:
    mapping(keyType => ValueType)
    
    keyType -> primary types (uint, address, bytes, etc)
    valueType -> primary types or another mapping or array

Mappings are not iterable. 
TODO: Check if there is way to list all keys/values
        like python dict.keys, dict.values, dict.items?
*/

contract Mapping {
    // Mapping address to balances
    mapping(address => uint) public balancesMap;

    function getBalance(address _addr) public view returns (uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value (of type).        
        return balancesMap[_addr];
    }

    function setBalance(address _addr, uint _amount) public {
        // Update the amount of this address
        balancesMap[_addr] = _amount;
    }

    function removeAddress(address _addr) public {
        // Reset the value at particular key to default value
        delete balancesMap[_addr];
    }
}


contract NestedMapping {
    // Nested Mapping = mapping key(here address) to another mapping
    mapping(address => mapping(uint => bool)) public balanceRulesMap;

    function getBalanceRule(address _addr, uint _amount) public view returns (bool) {
        // Use bracket notation like python nested dict to get value
        return balanceRulesMap[_addr][_amount];
    }

    function setBalanceRule(
        address _addr,
        uint _amount,
        bool _balanceUsed
    ) public {
        balanceRulesMap[_addr][_amount] = _balanceUsed;
    }

    function removeBalanceRule(address _addr, uint _amount) public {
        delete balanceRulesMap[_addr][_amount];
    }

}