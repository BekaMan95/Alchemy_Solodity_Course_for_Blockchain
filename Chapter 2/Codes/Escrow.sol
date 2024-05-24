// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint256 balance);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only the arbiter can approve");
        uint256 contractBalance = address(this).balance;
        (bool success, ) = beneficiary.call{value: contractBalance}("");
        require(success, "Transfer to beneficiary failed");
        emit Approved(contractBalance);
    }

    fallback() external payable {}

    receive() external payable {}
}