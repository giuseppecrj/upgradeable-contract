// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {Counter} from "../Counter.sol";
import {Counter2} from "../Counter2.sol";
import {ProxyTester} from "foundry-upgrades/ProxyTester.sol";

contract CounterTest is Test {
  ProxyTester internal proxy;
  Counter internal counter;

  address internal proxyAddress;
  address internal admin;

  function setUp() public {
    proxy = new ProxyTester();
    counter = new Counter();
    admin = vm.addr(69);
  }

  function testDeployUUPS() public {
    proxy.setType("uups");
    proxyAddress = proxy.deploy(
      address(counter),
      admin,
      abi.encodeWithSignature("initialize(uint256)", 20)
    );

    Counter proxyCounter = Counter(proxyAddress);
    proxyCounter.increment();
    console.log(proxyCounter.getNumber());

    Counter2 newCounter = new Counter2();
    proxy.upgrade(address(newCounter), admin, address(0));

    Counter2 newProxyCounter = Counter2(proxyAddress);
    console.log(newProxyCounter.hello());
    console.log(newProxyCounter.getNumber());
  }
}
