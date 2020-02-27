pragma solidity ^0.5.1;

contract Funding {
    address public owner;
    uint public raised;
    mapping(address => uint) public balances;

    constructor() public {
        owner = msg.sender;
    }

    function donate() public payable {
        balances[msg.sender] += msg.value;
        raised += msg.value; 
    } 
}