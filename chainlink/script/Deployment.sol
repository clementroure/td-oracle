// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {Script} from "forge-std/Script.sol";
import {StableCoinToken, EtherCoinToken} from "../src/Tokens.sol";
import {MarketPlace} from "../src/Marketplace.sol";

contract DeploymentScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // new StableCoinToken(); // https://sepolia.etherscan.io/token/0xa99ddc3965c609ae64f571870dd4a1a913ddf45a
        // new EtherCoinToken(); // https://sepolia.etherscan.io/token/0xc612c0b85b974b699f54087de03f85dd405d4065
        new MarketPlace(
            address(0xa99DdC3965C609AE64f571870DD4A1a913ddf45a), // StableCoin Address
            address(0xC612c0B85b974B699f54087de03f85dd405D4065) // EtherCoin Address
        );
        // https://sepolia.etherscan.io/address/0x27f5187e5fb206f3eb8ecd2c582c8173a7a3e778

        vm.stopBroadcast();
    }
}

// forge script script/Deployment.sol:DeploymentScript --rpc-url $RPC_URL --broadcast --verify -vvvv
