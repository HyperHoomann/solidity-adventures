# Build a Bank with Solidity

>__Objective__: Build a bank using Ethereum.  
>__Features__:  
>    - can deposit money  
>    - earn interest

## 1. Introduction
Ethereum = blockchain  
Solidity = programming language

Why Ethereum + Solidity
- Easier to build apps for transacting money -unlike traditional programming languages
Reason:
    - Solidity built-in constructs and data structures for security

## 2. Remix
https://remix.ethereum.org

- browser-based Code IDE for solidity
- also runs  a toy blockchain in the browser

## 3. First contract - get contract balance
1. first line - opensource license for code  
    ```solidity
    // SPDX-License-Identifier: MIT
    ```

2. second line - solidity compiler version to use  
    ```solidity
    pragma solidity ^0.8.0
    ```

3. `contract` - similar to class in other languages  

    ```solidity
    contract SmartBank {
        ...
    }
    ```

#### Accepting/Storing money in programs
> **A class/contract can accept and store money natively. without having to integrate payment gateways (like stripe/razorpay)**

  

#### Accounts on Ethereum
- Every user and every program has an account.
- Accounts = denoted by address (`0x123456...`)
- Accounts can hold money
- program also has an account where it can recieve money
- program can do whatever it wants with that account

```solidity
    contract SmartBank {
        uint totalContractBalance = 0;
        
        function getContractBalance () public view returns (uint) {
            return totalContractBalance
        }
    }
```
