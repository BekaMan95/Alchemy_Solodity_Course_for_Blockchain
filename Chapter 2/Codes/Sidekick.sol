// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        
        (bool success, ) = hero.call{value: 0}("");
        require(success, "Failed to make contact");
    }
}