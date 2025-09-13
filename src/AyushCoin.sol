// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

// import "@openzeppelin/contracts/"

import '@openzeppelin/contracts/token/ERC20/ERC20.sol' ; 


contract AyushCoin is ERC20{

    // uint256 number ; 
    
    constructor() ERC20("AyushCoin" , "AYUSH"){
        // mint myself some token logic 
        
    }

    function mint(address to , uint256 amount)public{
        _mint(to, amount);
    }

    



}
