// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Instance} from "ethernaut/00.sol";
import {AttackContract} from "src/ethernaut/00.sol";
import {TestBase} from "test/TestBase.sol";

contract TestAttack is Test, TestBase {
    Instance public instance;

    function setUp() public {
        instance = new Instance("password"); // create new challenge instance
        console.log("Instance address:", address(instance));
    }

    function test_attack() public {
        AttackContract attackContract = new AttackContract(address(instance)); // create attacker contract
        attackContract.exploit();
        assertEq(instance.getCleared(), true);
    }
}
