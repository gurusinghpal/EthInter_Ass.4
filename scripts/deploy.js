const hre = require("hardhat");
const { ethers } = require("ethers");

async function main() {
  // Get the Points smart contract
  const Degen = await hre.ethers.getContractFactory("DegenToken");

  // Deploy it
  const degen = await Degen.deploy();
  await degen.deployed();

  // Display the contract address
  console.log(`Degen token deployed to ${degen.address}`);

  // Listen for the PrizeRedeemed event
  const contract = new ethers.Contract(degen.address, Degen.interface, hre.ethers.provider);
  contract.on("PrizeRedeemed", (account, prizeName, prizeCost) => {
    console.log(`User ${account} redeemed ${prizeName} for ${prizeCost} tokens.`);
    // You can update your frontend UI or perform any other actions here.
  });

  // Now you can interact with the contract, mint tokens, transfer, redeem prizes, etc.
  // For example:
  // const signer = await hre.ethers.getSigners();
  // const address = await signer[0].getAddress();
  // const balanceBefore = await degen.checkBalance(address);
  // console.log(`Account ${address} balance before redeeming: ${balanceBefore}`);
  // await degen.redeemPrize(0); // Redeem the first prize
  // const balanceAfter = await degen.checkBalance(address);
  // console.log(`Account ${address} balance after redeeming: ${balanceAfter}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
