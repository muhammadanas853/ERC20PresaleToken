// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract PresaleToken is ERC20, Ownable {
    bool public saleActive = false;
    uint256 public tokenPrice = 0.0001 ether; // 1 token = 0.0001 ETH
    uint256 public maxCap = 10 ether; // Max ETH allowed in presale
    uint256 public totalRaised;

    constructor() ERC20("AnasToken", "ANAS") Ownable(msg.sender) {
        _mint(address(this), 1_000_000 * 10 ** decimals());
    }

    function setSaleActive(bool _active) external onlyOwner {
        saleActive = _active;
    }

    function setTokenPrice(uint256 _price) external onlyOwner {
        tokenPrice = _price;
    }

    function buyTokens() external payable {
        require(saleActive, "Presale not active");
        require(msg.value > 0, "Zero payment");
        require(totalRaised + msg.value <= maxCap, "Cap reached");

        uint256 amountToBuy = (msg.value * 10 ** decimals()) / tokenPrice;
        totalRaised += msg.value;

        _transfer(address(this), msg.sender, amountToBuy);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function withdrawUnsoldTokens(address to) external onlyOwner {
        _transfer(address(this), to, balanceOf(address(this)));
    }
}
