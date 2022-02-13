pragma solidity ^0.5.11;

import "./Owned.sol"; // Imports from "Owned.sol" - this is nice for sharing functionality across multiple files

/*
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
*/

contract InheritanceModifierExample is Owned {
    // ... is Owned inherits functionality from Owned
    // - You can have multiple inheritance
    // - Modifiers are maintained with inheritance

    mapping(address => uint) public tokenBalance;

    //address owner;

    uint tokenPrice = 1 ether;

    constructor() public {
        //owner = msg.sender;
        tokenBalance[owner] = 100;
    }

    /*
    modifier onlyOwner() {
        // Takes the body of the function and copies it to the "_" where onlyOwner is used below
        // - Changes the behaviour of functions
        require(msg.sender == owner, "You are not allowed.");
        _;
    }
    */

    function createNewToken() public onlyOwner {
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner {
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "Not enough tokens.");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens.");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}