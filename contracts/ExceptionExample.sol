//SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

contract ExceptionExample {

    mapping(address => uint64) public balanceRecieved;

    function recieveMoney() public payable {
        // assert is used to validate invariants
        // - Consumes all gas
        // - Assert should only be triggered if there is something wrong with your contract
        // - Assert is also triggered by errors in your code (out of bounds index, dividing by zero etc.)
        assert(balanceRecieved[msg.sender] + uint64(msg.value) >= balanceRecieved[msg.sender]);
        balanceRecieved[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        // require is used to validate user input
        // - Returns remaining gas
        require(_amount <= balanceRecieved[msg.sender], "You don't have enough Ether.");
        assert(balanceRecieved[msg.sender] >= balanceRecieved[msg.sender] - _amount);
        balanceRecieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    // Other notes:
    // - throw was used in older versions of Solidity
    // - revert can also be used and is used to revert the transaction
}