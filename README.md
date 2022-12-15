# Upgradable Minimal Proxy

[![Github Actions][gha-badge]][gha] 
[![Foundry][foundry-badge]][foundry] 
[![License: MIT][license-badge]][license]

[gha]: https://github.com/JaredBorders/upgradable-minimal-proxy/actions
[gha-badge]: https://github.com/JaredBorders/upgradable-minimal-proxy/actions/workflows/test.yml/badge.svg
[foundry]: https://getfoundry.sh/
[foundry-badge]: https://img.shields.io/badge/Built%20with-Foundry-FFDB1C.svg
[license]: https://opensource.org/licenses/MIT
[license-badge]: https://img.shields.io/badge/License-MIT-blue.svg

Proof of concept for an *upgradable* [minimal proxy](https://eips.ethereum.org/EIPS/eip-1167)

## Contracts

```
script/TestnetDeploy.s.sol ^0.8.13
└── lib/forge-std/src/Script.sol >=0.6.0 <0.9.0
    ├── lib/forge-std/src/console.sol >=0.4.22 <0.9.0
    ├── lib/forge-std/src/console2.sol >=0.4.22 <0.9.0
    └── lib/forge-std/src/StdJson.sol >=0.6.0 <0.9.0
        └── lib/forge-std/src/Vm.sol >=0.6.0 <0.9.0
src/Factory.sol ^0.8.0
├── lib/openzeppelin-contracts/contracts/proxy/Clones.sol ^0.8.0
└── src/WalletProxy.sol ^0.8.0
    └── lib/openzeppelin-contracts/contracts/proxy/Proxy.sol ^0.8.0
src/WalletProxy.sol ^0.8.0 (*)
src/implementations/Wallet1.sol ^0.8.0
src/implementations/Wallet2.sol ^0.8.0
test/Test.t.sol ^0.8.13
├── lib/forge-std/src/Test.sol >=0.6.0 <0.9.0
│   ├── lib/forge-std/src/Script.sol >=0.6.0 <0.9.0 (*)
│   └── lib/forge-std/lib/ds-test/src/test.sol >=0.5.0
├── lib/forge-std/src/console.sol >=0.4.22 <0.9.0
├── src/Factory.sol ^0.8.0 (*)
├── src/WalletProxy.sol ^0.8.0 (*)
├── src/implementations/Wallet1.sol ^0.8.0
└── src/implementations/Wallet2.sol ^0.8.0
```

## Code Coverage

```
+---------------------------------+----------------+----------------+---------------+----------------+
| File                            | % Lines        | % Statements   | % Branches    | % Funcs        |
+====================================================================================================+
| script/TestnetDeploy.s.sol      | 0.00% (0/3)    | 0.00% (0/4)    | 100.00% (0/0) | 0.00% (0/1)    |
|---------------------------------+----------------+----------------+---------------+----------------|
| src/Factory.sol                 | 100.00% (1/1)  | 100.00% (1/1)  | 100.00% (0/0) | 100.00% (1/1)  |
|---------------------------------+----------------+----------------+---------------+----------------|
| src/WalletProxy.sol             | 100.00% (8/8)  | 100.00% (8/8)  | 50.00% (1/2)  | 100.00% (6/6)  |
|---------------------------------+----------------+----------------+---------------+----------------|
| src/implementations/Wallet1.sol | 100.00% (2/2)  | 100.00% (2/2)  | 100.00% (0/0) | 100.00% (2/2)  |
|---------------------------------+----------------+----------------+---------------+----------------|
| src/implementations/Wallet2.sol | 100.00% (3/3)  | 100.00% (3/3)  | 100.00% (0/0) | 100.00% (3/3)  |
|---------------------------------+----------------+----------------+---------------+----------------|
| Total                           | 82.35% (14/17) | 77.78% (14/18) | 50.00% (1/2)  | 92.31% (12/13) |
+---------------------------------+----------------+----------------+---------------+----------------+
```

## Deployment Addresses

#### Optimism

#### Optimism Goerli
