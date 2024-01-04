// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract StableCoinToken is ERC20 {
    uint256 public number;

    constructor() ERC20("StableCoin", "STC") {
        _mint(msg.sender, 1000000000000000000000000000);
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function mintSomeTokens() public {
        _mint(msg.sender, 1000000000000000000000);
    }
}

contract EtherCoinToken is ERC20 {
    uint256 public number;

    constructor() ERC20("EtherCoin", "ETH") {
        _mint(msg.sender, 1000000000000000000000000000);
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function mintSomeTokens() public {
        _mint(msg.sender, 1000000000000000000000);
    }
}
