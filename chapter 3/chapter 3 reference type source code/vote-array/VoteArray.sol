// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
  enum Choices {
    Yes,
    No
  }

  struct Vote {
    Choices choice;
    address voter;
  }

  Vote[] public votes;

  function createVote(Choices choice) external {
    Vote memory newVote = Vote(choice, msg.sender);
    votes.push(newVote);
  }
}
