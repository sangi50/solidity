pragma solidity ^0.4.0;

contract bank {
  
   address owner;
   string public name;
   string public symbol;
    mapping(address=>uint256)balances;
    mapping(address=>mapping(address=>uint256))allowed;
    modifier check() {
        require(owner==msg.sender);
        _;
    }
    event Transfer(address owner,address to,uint256 amt);
    event Approval(address owner,address _spender,uint256 amt);
    function bank() {
        owner=msg.sender;
        name="MNW";
        symbol="M";
    }
     function totalSupply(uint256 amount) returns (uint256)
    {
        balances[msg.sender]=amount;
        return balances[msg.sender];
    }
  function transfer(address _to, uint256 _value) check payable{
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender]-(_value);
    balances[_to] = balances[_to]+(_value);
    Transfer(msg.sender,_to,_value);
  }
  
  function balanceOf(address owner) public view returns (uint256) {
    return balances[owner];
  }
  
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][_to]);

    balances[_from] = balances[_from]-(_value);
    balances[_to] = balances[_to]+(_value);
    allowed[_from][_to] = allowed[_from][_to]+(_value);
    Transfer(_from, _to, _value);
    return true;
  }
     function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }
function withdraw(uint256 a) {
    balances[msg.sender]=balances[msg.sender]-a;
}
  
  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

}
