// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/SimpleVote.sol";

contract SimpleVoteTest is Test {
    SimpleVote vote;

    address user1 = address(1);
    address user2 = address(2);

    function setUp() public {
        vote = new SimpleVote();
    }

    function testOwnerIsSetCorrectly() public view {
        assertEq(vote.owner(), address(this));
    }

    function testUserCanVoteYes() public {
        vm.prank(user1);
        vote.vote(true);

        assertEq(vote.yesVotes(), 1);
    }

    function testUserCanVoteNo() public {
        vm.prank(user1);
        vote.vote(false);

        assertEq(vote.noVotes(), 1);
    }

    function testUserCannotVoteTwice() public {
        vm.prank(user1);
        vote.vote(true);

        vm.prank(user1);
        vm.expectRevert();
        vote.vote(false);
    }

    function testVotesAreStoredCorrectly() public {
        vm.prank(user1);
        vote.vote(true);
        vm.prank(user1);

        bool choice = vote.getMyVote();
        assertEq(choice, true);
    }

    function testOnlyOwnerCanResetVotes() public {
        vm.prank(user1);
        vm.expectRevert();
        vote.resetVotes();
    }

    function testOwnerCanResetVotes() public {
        vote.vote(true);
        vote.resetVotes();

        assertEq(vote.yesVotes(), 0);
        assertEq(vote.noVotes(), 0);
    }
}
