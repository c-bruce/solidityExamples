pragma solidity ^0.5.11;

contract Owned {
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        // Takes the body of the function and copies it to the "_" where onlyOwner is used below
        // - Changes the behaviour of functions
        require(msg.sender == owner, "You are not allowed.");
        _;
    }
}