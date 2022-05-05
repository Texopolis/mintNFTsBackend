const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory("MintNFTs");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("contract deployed to: ", nftContract.address);

  let txn = await nftContract.mintNFT();
  await txn.wait();
  console.log("Minted NFT #1");

};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
