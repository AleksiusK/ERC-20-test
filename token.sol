pragma solidity ^0.4.24

contract Token {
    uint public totalSupply;
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    mapping(address => uint256) public balance;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed _from,address indexed _to, uint tokens);
    event Approval(address indexed _owner, address indexed _spender, uint tokens);

    constructor (string tokenName, string tokenSymbol, uint initialSupply) public {
        totalSupply = initialSupply*10**uint256(decimals);
        balance[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
    }

    function _transfer(address _from, address _to, uint256 value) internal {
        require(_to != 0x0);
        require(balance[_from] >= value);
        require(balance[_to] + _value >= balance[_to]);

        balance[_from] -= value
        balance[_to] += value
        emit Transfer(_from, _to, value)
    }
}