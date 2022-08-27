// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract MyVoteContract{
    //define the address of the voter.
    address payable voter;

//one account can only vote once.

    //mapping address to uint vote count.
    mapping(address => uint) voteCount;

    //to make sure the ether doesn't stay locked in the system.
    constructor() {
        voter = payable(msg.sender);
    }

    //view voter balance
    function voterBalance() public view returns(uint) {
        return voter.balance;
    }

    //payable function for the voter to vote with 1 ether.
    function castVote() public payable {
        require(voteCount[voter] < 1, "You can only cast your vote once!");
        voteCount[voter]++;
        voter.transfer(1 ether);
    }

}