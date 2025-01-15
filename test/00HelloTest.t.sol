// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Instance} from "ethernaut-contract/00Hello.sol";

contract HelloTest is Test {
    Instance public level0;

    function setUp() public {
        level0 = new Instance("password");
        console.log("Level0 address:", address(level0));
        console.log(level0.info());
    }

    function test_info() public view{
        assertEq(level0.info(), "You will find what you need in info1().");
    }

    function test_authenticate() public {
        level0.authenticate("password");
        assertEq(level0.getCleared(), true);
    }
}
