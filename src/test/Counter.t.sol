// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    function setUp() public {
       counter = new Counter();
         counter.initialize(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.getNumber(), 1);
    }

}
