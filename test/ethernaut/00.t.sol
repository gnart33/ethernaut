// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Instance} from "ethernaut/00.sol";
import {Attacker} from "src/ethernaut/00.sol";

contract AttackTest is Test {
    Instance public level0;

    function setUp() public {
        level0 = new Instance("password"); // create new challenge instance
        console.log("Level0 address:", address(level0));
    }

    function test_attack() public {
        Attacker attacker = new Attacker(address(level0)); // create attacker contract
        attacker.exploit();
        assertEq(level0.getCleared(), true);
    }
}
