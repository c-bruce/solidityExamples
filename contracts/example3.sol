// SPDX-License-Identifier: GPL-3.0

// Example showing struct, mapping and custom modifier functionality for a database of people
// Author: Callum Bruce
// Date: 23/01/22

pragma solidity ^0.8.11;

contract MyContract {
    uint256 public peopleCount = 0;

    mapping(uint => Person) public people;

    address ownerAddress;

    modifier owner() {
        require(msg.sender == ownerAddress); // If the person is the contract owner true, else error
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() {
        ownerAddress = msg.sender;
    }

    function addPerson(string memory _firstName, string memory _lastName) public owner {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    // Example of an internal function
    function incrementCount() internal {
        peopleCount ++;
    }
}