pragma solidity >=0.7.0 <0.9.0;

contract tokenbegin {
    uint public totalSupply;
    mapping(address => uint) public balances;
    event Transfer(address indexed from, address indexed to, uint tokens);
    constructor(uint _value) public{
        totalSupply = _value;
        balances[msg.sender] = totalSupply;
    }
    function transfer(address to,uint _value) public returns (bool){
    require(balances[msg.sender] >= _value);
    balances[to] += _value;
    balances[msg.sender] -= _value;
    emit Transfer(msg.sender,to, _value);
    return true;
    }
    function balancesOf(address owner) view public returns (uint){
       return balances[owner];
    }
}