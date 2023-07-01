// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Structure to represent a candidate
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    // Mapping to store the candidates
    mapping(uint256 => Candidate) public candidates;

    // Variable to keep track of the total number of candidates
    uint256 public candidatesCount;

    // Constructor to initialize the contract
    constructor() {
        addCandidate("Biden");
        addCandidate("Trump");
    }

    // Function to add a new candidate
    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // Function to vote for a candidate
    function vote(uint256 _candidateId) public {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");
        
        candidates[_candidateId].voteCount++;
    }
}
