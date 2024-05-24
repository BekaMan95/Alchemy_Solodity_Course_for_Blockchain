// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./FilterToStorage.sol";

contract ContractTest is Test {
  Contract public myContract;
  uint256[] arr;

  function setUp() public {
    myContract = new Contract();
  }

  function testFilter1() public {
    arr.push(1);
    arr.push(2);
    arr.push(4);
    myContract.filterEven(arr);

    assertEq(myContract.evenNumbers(0), 2);
    assertEq(myContract.evenNumbers(1), 4);

    vm.expectRevert();
    myContract.evenNumbers(2);
  }

  function testFilter2() public {
    arr.push(1);
    arr.push(12);
    arr.push(302);
    arr.push(7);
    arr.push(10);
    myContract.filterEven(arr);

    assertEq(myContract.evenNumbers(0), 12);
    assertEq(myContract.evenNumbers(1), 302);
    assertEq(myContract.evenNumbers(2), 10);

    vm.expectRevert();
    myContract.evenNumbers(3);
  }
}
