pragma solidity >=0.7.0 <0.9.0;

contract a {
    uint a =10 ;
    event SetA(uint a);
    function setA(uint _a) public {
        a = _a;
        emit SetA(_a);
    }
    function getA() public view returns (uint) {
        return a;
    }
}