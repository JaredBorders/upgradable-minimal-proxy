// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../src/Factory.sol";
import "../src/WalletProxy.sol";
import "../src/implementations/Wallet1.sol";
import "../src/implementations/Wallet2.sol";

// $ forge test -vv

contract CounterTest is Test {
    Factory public factory;
    WalletProxy public walletProxy;
    Wallet1 public wallet1;
    Wallet2 public wallet2;

    function setUp() public {
        // deploy factory
        factory = new Factory();

        // dpeloy implementation
        wallet1 = new Wallet1();
        wallet2 = new Wallet2();
    }

    function testWalletProxyWasSet() public view {
        assert(factory.walletProxy() != address(0));
    }

    function testCreatingWallet1() public {
        // create clone of proxy
        /// @dev proxy implementation at this point is NOT set
        address proxy = factory.createWallet();
        assert(proxy != address(0));

        /// @dev set the implementation address (i.e. address of wallet1)
        WalletProxy(payable(proxy))._updateImplementation(address(wallet1));

        /// @dev check functions and state of clone
        assert(Wallet1(proxy).a() == 0);
        assert(Wallet1(proxy).b() == 0);
        Wallet1(proxy).setA(19);
        Wallet1(proxy).setB(11);
        assert(Wallet1(proxy).a() == 19);
        assert(Wallet1(proxy).b() == 11);
    }

    function testUpgradeToWallet2() public {
        // create clone of proxy
        /// @dev proxy implementation at this point is NOT set
        address proxy = factory.createWallet();
        assert(proxy != address(0));

        /// @dev set the implementation address (i.e. address of wallet1)
        WalletProxy(payable(proxy))._updateImplementation(address(wallet1));

        /// @dev check functions and state of clone
        assert(Wallet1(proxy).a() == 0);
        assert(Wallet1(proxy).b() == 0);
        Wallet1(proxy).setA(19);
        Wallet1(proxy).setB(11);
        assert(Wallet1(proxy).a() == 19);
        assert(Wallet1(proxy).b() == 11);

        /// @dev *UPDATE* the implementation address (i.e. address of wallet2)
        WalletProxy(payable(proxy))._updateImplementation(address(wallet2));

        /// @dev check functions and state of clone
        assert(Wallet2(proxy).c() == 0);
        Wallet2(proxy).setC(99);
        assert(Wallet2(proxy).a() == 19);
        assert(Wallet2(proxy).b() == 11);
        assert(Wallet2(proxy).c() == 99);
    }
}
