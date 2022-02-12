// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract SendMoneyExample {

    uint public balanceRecieved;

    function recieveMoney() public payable {
        balanceRecieved += msg.value;
    }

    function getBalance() public view returns (uint) {
        // Returns the value of the smart contract address balance in wei
        return address(this).balance;
    }

    function withdrawMoney() public {
        //address payable to = msg.sender; // Old versions
        address payable to = payable(msg.sender); // Newer versions
        to.transfer(this.getBalance());
    }

    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}