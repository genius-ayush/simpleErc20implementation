// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/AyushCoin.sol";
import {console} from "forge-std/Test.sol";


// import {console} from  '/forge-std/console.sol' ; 

contract TestAyushCoin is Test{

    AyushCoin c ; 
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    function setUp()public{
        c = new AyushCoin() ; // this is actually 0.001 tokens
    }

    function testSimple() public{
        assertEq(uint(2), uint(2) , "ok");
    }

    // function testMint()public{
        
    //     c.mint(address(this), 100);
    //     assertEq(c.balanceOf(address(this)), 100 , "ok");

    //     c.mint(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D , 100);
    //     assertEq(c.balanceOf(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D), 100 , "ok");
    // }

    // function testTransfer() public{
    //     c.mint(address(this), 101);
    //     c.transfer(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D, 100);
    //     assertEq(c.balanceOf(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D), 100 , "ok");
    //     assertEq(c.balanceOf(address(this)), 1 , "ok");

    //     vm.prank(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D);
    //     c.transfer(address(this), 100);

    //     assertEq(c.balanceOf(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D), 0 , "ok");
    //     assertEq(c.balanceOf(address(this)), 101 , "ok");
        
    //     }


    // function testApprovals() public{
    //     c.mint(address(this), 100);
    //     c.approve(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D, 50);

    //     vm.prank(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D);
    //     c.transferFrom(address(this), 0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D, 20);

    //     assertEq(c.balanceOf(address(this)), 80 , 'ok');
    //     assertEq(c.balanceOf(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D), 20);
    // }

    // function testRevert_SpendToken()public{
    //     c.mint(address(this), 10);
    //     vm.expectRevert();
    //     c.transfer(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D, 15);
        
    // }

    // function testRevert_FailedApprovals()public{

    //     c.mint(address(this) , 100) ;
    //     c.approve(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D ,10);

    //     vm.prank(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D) ;
    //     vm.expectRevert() ; 
    //     c.transferFrom(address(this) ,0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D ,20) ; 
    // }

    function testTransferEmits()public{
        console.logString("hey there") ;
        c.mint(address(this), 100);

        vm.expectEmit(true , true, false, true);

        emit Transfer(address(this) , 0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D , 50) ;

        c.transfer(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D, 50);
    }

    function testApprovalEmits()public{

        c.mint(address(this), 100);

        vm.expectEmit(true , true , false , true) ;

        emit Approval(address(this) , 0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D , 50);
        c.approve(0x7AD9D8F09501CF0Df7DF673a9e2c46d07483bF7D, 50);
    }


}
