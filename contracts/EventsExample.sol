pragma solidity ^0.5.11;

contract EventsExample  {

    mapping(address => uint) public tokenBalance;

    event TokensSent(address _from, address _to, uint _amount);
    // Events are used by external aplications via the RPC interface of an Ethereum client (subscribe and listen to events)
    // - Used for return values, data store or trigger
    // - Events cannot be retrieved from within Smart Contracts
    // - Event arguments marked as indexed can be searched for
    // Events are cheap

    constructor() public {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens.");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokensSent(msg.sender, _to, _amount);

        return true;
    }
}