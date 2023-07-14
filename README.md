# DegenToken

DegenToken is a Solidity smart contract that implements an ERC20 token

## Description

DegenToken is a Solidity smart contract that implements an ERC20 token called DegenToken (symbol: DGN). The contract provides basic functionalities for minting, transferring, and burning tokens, with ownership control for minting and an external function to check balances.

## Features

Minting: The contract owner can mint new DGN tokens and assign them to a specified recipient address.

Transferring: Token holders can transfer DGN tokens to other addresses while ensuring the transfer amount is greater than zero.

Burning: Token holders can burn a specific amount of DGN tokens to reduce their balance.

Balance Checking: An external function allows anyone to check the token balance of a specific account.

## Getting Started

### Installing

To run the contract, follow these steps:

1. Install the project dependencies by running the following command:

   ```bash
   npm i
   ```

2. Install 'hardhat' by running the command:
   
   ```bash
   npm install --save-dev hardhat
   ```

3. Install OpenZeppelin:

   ```bash
    npm install @openzeppelin/contracts
    ```
   
5. Start a blockchain locally by running the command:
   
   ```bash
   npx hardhat node
   ```

6. Deploy the DegenToken smart contract to Fuji (C-Chain) Network by running the deployment script:

  ```bash
  npx hardhat run scripts/deploy.js --network fuji
  ```

### Executing program

* Go to [remix](remix.ethereum.org) IDE.
* Paste the contract in the IDE.
* Compile the contract.
* Select the `Injected Provide - Metamask` as the environment in Deploy tab.
* Paste you contract address in remix and click on `Deploy`.
* Interact with your contract in remix!!

## Authors

[@gurusinghpal](https://www.linkedin.com/in/guru-singh-pal-99a305254/)


## License

This code is released under the MIT License. Feel free to use, modify, and distribute it as per the terms of the license.

