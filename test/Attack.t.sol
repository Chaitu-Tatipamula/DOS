pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {Attack} from "../src/Attack.sol";
import {Good} from "../src/Good.sol";
import {console} from "forge-std/console.sol";

contract TestAttack is Test{
    Good public goodContract;
    Attack public attackContract;

    function setUp() public{
        vm.prank(vm.addr(111));
        goodContract = new Good();

        attackContract = new Attack(address(goodContract));
    }

    function testAttack() public{
        address first = vm.addr(1);
        address second = vm.addr(2);

        deal(first, 100 ether);
        deal(second, 100 ether);

        vm.prank(first);
        goodContract.setEthToWin{value : 1 ether}();

        attackContract.attack{value : 2 ether}();
        
        vm.prank(second);
        goodContract.setEthToWin{value : 3 ether}();

        console.logAddress(goodContract.currentWinner());
        console.logUint(goodContract.currentWinningETH());
    }
}