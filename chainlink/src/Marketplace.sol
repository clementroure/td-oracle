// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {AggregatorV3Interface} from "./chainLinkInterface.sol";

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract MarketPlace {
    address public stableCoinAddress = address(0x00);
    address public etherCoinAddress = address(0x00);

    AggregatorV3Interface internal dataFeed;

    uint public ethPrice = 0;

    constructor(address _stableCoinAddress, address _etherCoinAddress) {
        stableCoinAddress = _stableCoinAddress;
        etherCoinAddress = _etherCoinAddress;
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    function getEthPrice() public returns (uint) {
        (
            uint80 roundID,
            int256 price,
            uint256 startedAt,
            uint256 timeStamp,
            uint80 answeredInRound
        ) = dataFeed.latestRoundData();
        ethPrice = uint(price);
        return ethPrice;
    }

    function swapStableForEth(uint stableAmount) public {
        uint _ethPrice = getEthPrice();
        require(_ethPrice > 0, "Invalid ETH price");
        uint ethAmount = (stableAmount * 10 ** 8) / _ethPrice;

        require(
            IERC20(stableCoinAddress).allowance(msg.sender, address(this)) >=
                stableAmount,
            "Not enough allowance"
        );
        require(
            IERC20(stableCoinAddress).transferFrom(
                msg.sender,
                address(this),
                stableAmount
            ),
            "Stablecoin transfer failed"
        );
        IERC20(etherCoinAddress).transfer(msg.sender, ethAmount);
    }

    function swapEthForStable(uint ethAmount) public {
        uint _ethPrice = getEthPrice();
        require(_ethPrice > 0, "Invalid ETH price");
        uint stableAmount = (ethAmount * _ethPrice) / 10 ** 8;

        require(
            IERC20(etherCoinAddress).allowance(msg.sender, address(this)) >=
                ethAmount,
            "Not enough allowance"
        );

        require(
            IERC20(etherCoinAddress).transferFrom(
                msg.sender,
                address(this),
                ethAmount
            ),
            "EtherToken transfer failed"
        );
        IERC20(stableCoinAddress).transfer(msg.sender, stableAmount);
    }
}
