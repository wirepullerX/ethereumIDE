var Web3 = require('web3');
var web3 = new Web3(Web3.givenProvider || 'ws://some.local-or-remote.node:8546');
var addressContract = '0x2d609aaF409879a099DB1Faa4773405C5d293526'
var abi = [
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_a",
				"type": "uint256"
			}
		],
		"name": "setA",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "a",
				"type": "uint256"
			}
		],
		"name": "SetA",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "getA",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
var myContract = new web3.eth.Contract(abi, addressContract)

myContract.events.SetA({
    formBlock: web3.utils.toHex(0)
},function(error,event){
    console.log(event);
}
).on('data',function(event){
    console.log(event);
}).on('changed',function(event){
    console.log(event);
}).on('error',console.error)