const hre = require("hardhat");

async function main() {
  // Get the contract factory
  const CertificateFactory = await hre.ethers.getContractFactory("PrivateCertificateChecker");

  console.log("Deploying PrivateCertificateChecker contract to Core Blockchain testnet...");
  
  // Deploy the contract
  const contract = await CertificateFactory.deploy();
  await contract.deployed();

  console.log(`✅ Contract deployed at address: ${contract.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exit(1);
  });
