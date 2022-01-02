// SPDX-License-Identifier: GNU GPL v3
pragma solidity ^0.8.10;

contract EtherUnits {
    uint public oneWei = 1 wei;
    // 1 wei == 1
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    // 1 ether == 10^18 wei
    bool public isOneEther = 1 ether == 1e18;

    uint public calculateEthToWei = 1e18 wei;
    bool public isOneCalculatedEth = oneEther == calculateEthToWei;
}