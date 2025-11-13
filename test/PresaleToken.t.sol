// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import { Test } from "forge-std/Test.sol";
import { PresaleToken } from "../src/ERC20Presale.sol";

contract PresaleTokenTest is Test {
    PresaleToken token;
    address buyer = address(0x123);

    function setUp() public {
        token = new PresaleToken();
        token.setSaleActive(true);
        vm.deal(buyer, 1 ether);
    }

    function testBuyTokens() public {
        vm.prank(buyer);
        token.buyTokens{value: 0.001 ether}();
        assertGt(token.balanceOf(buyer), 0);
    }
}
