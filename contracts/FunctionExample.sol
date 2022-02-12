//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract FunctionsExample {

    mapping(address => uint) public balanceRecieved;

    address payable public owner;

    constructor() {
        // Called only once during deployment
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address) {
        // A view function is used for reading from the state and from other view functions
        return owner;
    }

    function convertWeiToEther(uint _amountInWei) public pure returns(uint) {
        // A pure function is a function that does not interact with stored variables
        return _amountInWei / 1 ether;
    }

    function destroySmartcontract() public {
        require(msg.sender == owner, "You are not the owner!");
        selfdestruct(owner);
    }

    function recieveMoney() public payable {
        assert(balanceRecieved[msg.sender] + msg.value >= balanceRecieved[msg.sender]);
        balanceRecieved[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceRecieved[msg.sender], "You don't have enough Ether.");
        assert(balanceRecieved[msg.sender] >= balanceRecieved[msg.sender] - _amount);
        balanceRecieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    receive() external payable {
        recieveMoney();
    }
}