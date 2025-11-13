// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Script } from "forge-std/Script.sol";
import { PresaleToken } from "../src/ERC20Presale.sol";

contract DeployPresale is Script {
    function run() external {
        vm.startBroadcast();
        new PresaleToken();
        vm.stopBroadcast();
    }
}
