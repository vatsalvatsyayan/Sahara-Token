pragma solidity >=0.4.2 <0.9.0; 

import "./DappToken.sol";

contract DappTokenSale {

	address payable admin;
	DappToken public tokenContract;
	uint256 public tokenPrice;
	uint256 public tokensSold;
	address payable addr;

	event Sell(address _buyer, uint256 _amount);

	constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
		//Assign an admin 
		admin = msg.sender; 
	
		//Token Contract
		tokenContract = _tokenContract;

		//Token Price
		tokenPrice = _tokenPrice;

		addr = payable(address(admin));
		
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

	// Ending the token sale
	// function endSale() public {
	// 	// Require that only admin can perform this function
	// 	require(msg.sender == admin);
	// 	// When IOC is finished, we want to transfer the number of tokens back to the admin
	// 	require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));
	// 	// Destroy the contract, the code is immutable so the state variables will be cleared out
	// 	selfdestruct(payable(admin));

	// }

	function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin,tokenContract.balanceOf(address(this))));
        selfdestruct(admin);
    }
}