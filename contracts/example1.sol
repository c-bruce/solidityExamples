// SPDX-License-Identifier: GPL-3.0

// Example contract for storing, getting and setting a value
// Author: Callum Bruce
// Date: 23/01/22

pragma solidity ^0.8.11;

contract MyContract {
    string value;

    constructor() {
        value = "defaultValue";
    }

    function get() public view returns(string memory) {
        return value;
    }
    // Note on visability specifiers:
    // public - visible externally and internally
    // view - disallows modification of state

    function set(string memory _value) public {
        value = _value;
    }
}