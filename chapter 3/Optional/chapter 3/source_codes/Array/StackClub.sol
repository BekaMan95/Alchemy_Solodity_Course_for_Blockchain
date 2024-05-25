// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] members;

    constructor() {
        members.push(msg.sender);
    }

    function addMember(address newMember) external {
        require(isMember(msg.sender));
        members.push(newMember);
    }
    function isMember(address num) public view returns (bool) {
        for(uint idx = 0; idx < members.length; idx++) {
            if(members[idx] == num) return true;
        }
        return false;
    }
    function removeLastMember() external {
        require(isMember(msg.sender));
        members.pop();
    }
}
