
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OptimizedTemplate {

    address public owner;
    mapping(address => uint256) internal balances;
    mapping(address => bool) internal isAdmin;
    bool private locked;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier nonReentrant() {
        require(!locked, "Reentrancy blocked");
        locked = true;
        _;
        locked = false;
    }

    constructor() {
        owner = msg.sender;
        isAdmin[msg.sender] = true;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(balances[msg.sender] >= amount, "Insufficient");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function adminTransfer(address user, uint256 amount)
        external
        onlyOwner
    {
        balances[user] += amount;
    }

    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }
}
