# Simple Voting Smart Contract

## Description
This is a Solidity smart contract for simple voting. Users can vote YES or NO, and the contract ensures that no one votes twice. The owner can reset the votes.

## Features
- Mapping to store voters
- Struct to store voter info
- Event to log votes
- Prevents double voting
- Owner can reset votes

## Functions
- `vote(bool _voteYes)` → Cast your vote
- `getResult()` → See which option is winning
- `getMyVote()` → Check your own vote
- `hasUserVoted()` → Check if you voted
- `resetVotes()` → Owner can reset votes

## Usage
1. Connect with MetaMask or other Ethereum wallet
2. Call `vote(true)` for YES or `vote(false)` for NO
3. Check results with `getResult()`

## Author
Hassan Salad

## License
MIT# SIMPLE-VOTING-CONTRACT
A simple Solidity voting smart contract
