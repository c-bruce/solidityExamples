// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";

contract LibrariesExample  {

    using SafeMath for uint; // Here we "use" the functions defined in the imported SafeMath library

    mapping(address => uint) public tokenBalance;

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns(bool) {
        //tokenBalance[msg.sender] -= _amount;
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        //tokenBalance[_to] += _amount;
        tokenBalance[_to] = tokenBalance[_to].add(_amount);

        return true;
    }
}