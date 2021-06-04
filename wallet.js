const { ethers } = require("ethers");
// let privateKey = "0x0123456789012345678901234567890123456789012345678901234567890123";
// let wallet = new ethers.Wallet(privateKey);
// console.log(wallet.address);

// let randomWallet = ethers.Wallet.createRandom();
// console.log(randomWallet);

let mnemonic = "radar blur cabbage chef fix engine embark joy scheme fiction master release";
let mnemonicWallet = ethers.Wallet.fromMnemonic(mnemonic);

// Load the second account from a mnemonic
let path = "m/44'/60'/1'/0/0";
let secondMnemonicWallet = ethers.Wallet.fromMnemonic(mnemonic, path);
console.log(secondMnemonicWallet);
// // Load using a non-english locale wordlist (the path "null" will use the default)
// let secondMnemonicWallet = ethers.Wallet.fromMnemonic(mnemonic, null, ethers.wordlists.ko);