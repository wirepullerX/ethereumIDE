contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;//reture true
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}


contract TokenBegin is Owned{
    uint public totalSupply;
    mapping(address => uint) public balances;
    mapping(address => mapping (address => uint256)) allowed;
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    
    string public constant name = "bird";
    string public constant symbol = "NTR";
    uint8 public constant decimals = 18;  // 18 is the most common number of decimal places
    
    constructor(uint _value) public {
        totalSupply = _value;
        balances[msg.sender] = totalSupply;
    }
    function transfer(address to, uint _value) public returns (bool) {
        require(balances[msg.sender] >= _value);
        balances[to] += _value;
        balances[msg.sender] -= _value;
        emit Transfer(msg.sender, to, _value);
        return true;
    }
    function balanceOf(address owner) view public returns (uint){
        return balances[owner];
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        balances[_from] -= _value;
        allowed[_from][msg.sender] += _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    function approve(address _spender, uint256 _value) public returns (bool success){
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return allowed[_owner][_spender];
    }
    
    
    function mintSupply(uint _value) public onlyOwner returns(bool) {
        totalSupply += _value;
        balances[msg.sender] += _value;
        return true;
    }
    function burnSupply(uint _value) public onlyOwner returns(bool) {
        require(balances[msg.sender] >= _value, 'Something bad happened') ;
        totalSupply -= _value;
        balances[msg.sender] -= _value;
        return true;
    }
}