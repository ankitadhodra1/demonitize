// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Demonetization {
    address public owner;
    mapping(address => uint256) public balances;
    bool public active = true;

    event Mint(address indexed to, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    modifier contractIsActive() {
        require(active, "Contract is not active");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function mint(address to, uint256 amount) public onlyOwner contractIsActive {
        require(to != address(0), "Cannot mint to zero address");
        require(amount > 0, "Amount must be greater than zero");

        balances[to] += amount;
        emit Mint(to, amount);
    }

    function transfer(address to, uint256 amount) public contractIsActive {
        require(to != address(0), "Cannot transfer to zero address");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function deactivateContract() public onlyOwner {
        active = false;
    }

    function testAssert(uint256 value) public pure {
        assert(value != 0);
    }

    function testRevert(bool condition) public pure {
        if (!condition) {
            revert("Condition is not met");
        }
    }
}
