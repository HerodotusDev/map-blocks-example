// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ISatellite} from "../lib/herodotus-evm-v2/src/interfaces/ISatellite.sol";

contract BlockMapper {
    uint256 public constant L1_CHAIN_ID = 11155111;
    uint256 public constant L2_CHAIN_ID = block.chainid;

    ISatellite public satellite;

    constructor(address _satellite) {
        satellite = ISatellite(_satellite);
    }

    function mapBlockNumberL1ToL2(uint256 l1BlockNumber) public returns (uint256 l2BlockNumber) {
        uint256 timestamp = satellite.headerField(L1_CHAIN_ID, l1BlockNumber, satellite.BlockHeaderField.TIMESTAMP);
        l2BlockNumber = satellite.timestamp(L2_CHAIN_ID, timestamp);
    }
}
