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
- Connect with MetaMask or another Ethereum wallet  
- Call `vote(true)` for YES or `vote(false)` for NO  
- Check results with `getResult()`  

## Tests
This project includes tests written with Foundry.

To run tests:
forge test


The tests verify:
- Voting logic
- Prevention of double voting
- Vote storage correctness
- Owner-only reset functionality

## Author
Hassan Salad

## License
MIT
