pragma solidity >=0.4.2 <0.9.0;

contract DappToken {
	// Constructor 
	// Set the total number of tokens
	// Read the total number of tokens

	//name
	string public name = "DApp Token";

	//symbol
	string public symbol = "DAPP";

	//standard
	string public standard = "DApp Token v1.0";

	uint256 public totalSupply;

	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value 
	);
 
	mapping(address => uint256) public balanceOf;
 
	constructor(uint256 _initialSupply) public {
		balanceOf[msg.sender] = _initialSupply;
		totalSupply = _initialSupply;
		// allocate the initial supply 

	}

	//Transfer
	function transfer(address _to, uint256 _value) public returns (bool success){
	//Exception if acc doesn't have enough
	require(balanceOf[msg.sender] >= _value); 
	//Transfer the balance
	balanceOf[msg.sender] -= _value;
	balanceOf[_to] += _value;
	//Transfer Event

	emit Transfer(msg.sender, _to, _value);

	//Return a boolean
	return true;
	
	}


}