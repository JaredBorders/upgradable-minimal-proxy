// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "./WalletProxy.sol";

contract Factory {
    using Clones for address;

    address public walletProxy;

    constructor() {
        walletProxy = address(new WalletProxy());
    }

    function createWallet() external payable returns (address) {
        return walletProxy.clone();
    }
}
