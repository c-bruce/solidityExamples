// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract WorkingWithVariables {
    // Unsigned integers
    uint256 public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    // Booleans
    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    // Integer wrap around
    // - Variables would "secretly" wrap around in versions prior to 0.8.*: i.e. 0 - 1 = 255 for uint8
    uint8 public myUint8;

    function incrementUint() public {
        myUint8++;
    }

    function decrementUint() public {
        myUint8--;
    }

    // Addresses
    address public myAddress;

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }

    // Strings
    // - Strings are a reference type (internally stored as a bytes array)
    // - Not as easy to work with as in other languages (no concat etc.)
    // - Working with strings is quite expensive in gas
    string public myString = "Hello world!";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}