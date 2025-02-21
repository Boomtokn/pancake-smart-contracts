import { constants } from "@openzeppelin/test-helpers";
import { ethers, network } from "hardhat";
import config from "../config";

const main = async () => {
  try {
    // Get the current network name (hardhat, testnet, or mainnet)
    const { name } = network;
    console.log(`Deploying to network: ${name}`);

    // Validate private key for mainnet deployment
    if (name === "mainnet" && !process.env.KEY_MAINNET) {
      throw new Error("Missing private key, refer to README 'Deployment' section");
    }

    // Validate CakeVault address
    if (!config.CakeVault[name] || config.CakeVault[name] === constants.ZERO_ADDRESS) {
      throw new Error("Missing CakeVault address, refer to README 'Deployment' section");
    }

    console.log("Deploying VaultOwner contract...");

    // Deploy VaultOwner contract
    const VaultOwner = await ethers.getContractFactory("VaultOwner");
    const vaultOwner = await VaultOwner.deploy(config.CakeVault[name]);

    await vaultOwner.deployed();
    console.log(`VaultOwner deployed successfully at address: ${vaultOwner.address}`);
  } catch (error) {
    console.error("Deployment failed:", error);
    process.exit(1);
  }
};

// Execute deployment
main().then(() => process.exit(0));
