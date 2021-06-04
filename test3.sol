pragma solidity >=0.4.22 <0.6.0;

contract loan {
    
    mapping(address => bool) public borrow;
    mapping(address => uint) public balances;
    mapping(address => Borrower) public borrower_contract;
    
    event BorrowCall(address borrower, uint _value, uint installment, uint interest, address no);
    struct Borrower {
        address borrow;
        uint amount;
        uint interest;
        address no;
        uint installments;
    }
    
    function deposit() payable public {
        balances[msg.sender] = msg.value;
        
    }
    function Installment() internal returns(bool){
        
        Borrower storage borow = borrower_contract[msg.sender];
        if(borow.installments == 1){
           require(borow.amount == msg.value);
           borrow[msg.sender] = false;
        }
        borow.installments -= 1;
        borow.amount -= msg.value;
       
        return true;
    }
    function borrowStart(uint _value, uint _installments, uint _interest) public returns(bool){
        require(!borrow[msg.sender]);
        require(address(this).balance >= _value, 'this contract not enough balance');
        Borrower storage borow = borrower_contract[msg.sender]; 
        borow.amount = _value;
        borow.interest = _interest;
        borow.installments = _installments;
        borow.borrow = msg.sender;
        borow.no = tx.origin;
        
        msg.sender.transfer(_value);
        emit BorrowCall(msg.sender, _value, _installments, _interest, tx.origin);
        borrow[msg.sender] = true;
        return true;
        
    }
    
    function ()  payable external {
        if(borrow[msg.sender]){
            Installment();
        }else{
            deposit();   
        }
    
        
    }
}