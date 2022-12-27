pragma solidity 0.5.16;

contract Election {
    // Read/write candidate
    string public candidate;

    constructor() public {                 
        candidate = "Candidate 1";       
    }  
    
}