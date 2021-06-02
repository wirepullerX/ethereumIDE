pragma solidity >=0.7.0 <0.9.0;

contract bird
{
    uint256 public number_smart;
    constructor(uint256 number) public{
        number_smart = number;
    }
    function chargenum (uint256 value) public returns(bool){
        number_smart = value;
        return true;
    }
}