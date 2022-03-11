pragma solidity >=0.4.2 <0.9.0; 

import "./DappToken.sol";

contract DappTokenSale {

	address admin;
	DappToken public tokenContract;
	uint256 public tokenPrice;
	uint256 public tokensSold;

	event Sell(address _buyer, uint256 _amount);

	constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
		//Assign an admin 
		admin = msg.sender; 
	
		//Token Contract
		tokenContract = _tokenContract;

		//Token Price
		tokenPrice = _tokenPrice;
	} 

	// multiply 
	function multiply(uint x, uint y) internal pure returns (uint z) {
		require(y == 0 || (z = x * y)/ y == x);
	}

	// Buy Tokens
	function buyTokens(uint256 _numberOfTokens) public payable {

		//Require that value is equal to tokens
		require(msg.value == multiply(_numberOfTokens,tokenPrice));
		
		// Require that there are enough tokens in the contact
		require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);

		//Require that a transfer is successful 
		require(tokenContract.transfer(msg.sender, _numberOfTokens));

		//keep track of number of tokens sold
		tokensSold += _numberOfTokens;

		// emit sell event
		emit Sell(msg.sender, _numberOfTokens);

	}
}