# Demonitization Smart Contract


## Description
This Solidity smart contract manages a simple banking system, demonstrating the use of require(), assert(), and revert() statements. Users can deposit and withdraw Ether, with require() ensuring valid deposits, checking sufficient balance for withdrawals, and non-zero transfers. assert() checks internal invariants to confirm state consistency, while revert() provides a mechanism to handle errors and undo transactions when conditions are not met. The contract maintains a mapping of user balances, ensuring secure and accurate tracking of deposits and withdrawals.
## Executing Program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Assesment.sol). Copy and paste the following code into the file:




bash


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


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile Assesment.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. 






## Authors

- Ankita
  ankita756900@gmail.com



## License

This project is licensed under [MIT](https://choosealicense.com/licenses/mit/) License - see the LICENSE.md file for details
