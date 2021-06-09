require("@nomiclabs/hardhat-waffle");

// Go to https://www.alchemyapi.io, sign up, create
// a new App in its dashboard, and replace "KEY" with its key
const ALCHEMY_API_KEY = "https://eth-rinkeby.alchemyapi.io/v2/4eEz_DFtK4lN7N3ZhScWziABByOjdvGS";

// Replace this private key with your Ropsten account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Be aware of NEVER putting real Ether into testing accounts
const ROPSTEN_PRIVATE_KEY = "9ebc86b291598c1e4909fed589a5c8b932f3c91c8c629f8b712f72517c9717fa";

module.exports = {
  solidity: "0.7.3",
  networks: {
    rinkeby: {
      url: `https://eth-rinkeby.alchemyapi.io/v2/4eEz_DFtK4lN7N3ZhScWziABByOjdvGS`,
      accounts: [`0x${ROPSTEN_PRIVATE_KEY}`]
    }
  }
};