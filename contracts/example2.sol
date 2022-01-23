// SPDX-License-Identifier: GPL-3.0

// Example showing enum functionality for a coffee order
// Author: Callum Bruce
// Date: 23/01/22

pragma solidity ^0.8.11;

contract MyContract {
    enum Coffee { SHORT, MEDIUM, LONG }
    Coffee public choice;

    constructor() {
        choice = Coffee.MEDIUM; // Default enum value
    }

    function getChoice() public view returns(Coffee) {
        return choice;
    }

    function setShort() public {
        choice = Coffee.SHORT;
    }

    function setMedium() public {
        choice = Coffee.MEDIUM;
    }

    function setLong() public {
        choice = Coffee.LONG;
    }
}