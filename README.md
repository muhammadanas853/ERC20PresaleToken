# ERC20 Presale Token (Foundry)

Simple ERC-20 token with a presale contract built using Foundry.

## Features
- ERC20 token (minted to contract)
- Toggleable presale (buy with ETH)
- Owner withdraws collected ETH
- Foundry tests and deploy script included

## Quick commands
```bash
# build
forge build

# test
forge test -vv

# deploy (example)
forge script script/DeployPresale.s.sol --rpc-url <RPC> --private-key <KEY> --broadcast
