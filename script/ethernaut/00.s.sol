pragma solidity ^0.8.0;

import {Instance} from "ethernaut/00.sol";
import {AttackContract} from "src/ethernaut/00.sol";
import {Script} from "forge-std/Script.sol";

contract Attack is Script {
    // creating and submitting instance are done manually on the frontend
    address instanceAddress = 0xc5a3F5816a876911AD319901060F45c6b18dF535;

    function run() public {
        vm.startBroadcast();
        AttackContract attackContract = new AttackContract(instanceAddress);
        attackContract.exploit();
        vm.stopBroadcast();
    }
}
