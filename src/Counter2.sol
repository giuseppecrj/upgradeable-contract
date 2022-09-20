// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter2 {
  uint256 public _number;

  function initialize(uint256 number) public {
    _number = number;
  }

  function increment() public {
    _number++;
  }

  function getNumber() public view returns (uint256) {
    return _number;
  }

  function hello() public pure returns (string memory) {
    return "hello";
  }
}
