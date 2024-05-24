// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    address public charityAddress;
    bool public contractActive = true;

    constructor(address _charityAddress) {
        owner = msg.sender;
        charityAddress = _charityAddress;
    }
    receive() external payable {    
    }
    fallback() external payable {
       
    }
    
    function tip() public payable {
        require(msg.value > 0, "You must send some Ether to tip.");
        payable(owner).transfer(msg.value);
    }
    function donate() public {
        
  require(contractActive, "Contract is no longer active");
        uint256 balance = address(this).balance;
        payable(charityAddress).transfer(balance);
        contractActive = false;
        selfdestruct(payable(owner));
    }
    
}