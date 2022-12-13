// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/Proxy.sol";

contract WalletProxy is Proxy {
    bytes32 internal constant _IMPLEMENTATION_SLOT =
        bytes32(uint256(keccak256("eip1967.proxy.implementation")) - 1);

    struct AddressSlot {
        address value;
    }

    function _getAddressSlot(bytes32 slot)
        internal
        pure
        returns (AddressSlot storage r)
    {
        assembly {
            r.slot := slot
        }
    }

    function _updateImplementation(address _impl) external {
        _getAddressSlot(_IMPLEMENTATION_SLOT).value = _impl;
    }

    function _implementation() internal view override returns (address) {
        address impl = _getAddressSlot(_IMPLEMENTATION_SLOT).value;
        require(impl != address(0), "IMPLEMENTATION NOT SET");
        return impl;
    }

    function _fallback() internal override {
        _beforeFallback();
        _delegate(_implementation());
    }

    fallback() external payable override {
        _fallback();
    }

    receive() external payable override {
        _fallback();
    }

    function _beforeFallback() internal override {}
}
