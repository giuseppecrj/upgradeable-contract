// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    uint256 public _number;

    function initialize(uint256 number) public {
        _number = number;
    }

    function increment() public {
        _number++;
    }

    function getNumber() public view returns (uint) {
        return _number;
    }
}
