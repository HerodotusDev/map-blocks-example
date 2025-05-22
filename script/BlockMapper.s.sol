// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {BlockMapper} from "../src/BlockMapper.sol";

contract BlockMapperScript is Script {
    BlockMapper public counter;

    function setUp() public {}

    function run() public {
        address apeChainSatellite = 0x0000000000000000000000000000000000000000;

        vm.startBroadcast();

        counter = new BlockMapper(apeChainSatellite);

        vm.stopBroadcast();
    }
}
