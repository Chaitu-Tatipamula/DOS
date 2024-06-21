// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

contract Good{
    address public currentWinner;
    uint public currentWinningETH;

    constructor(){
        currentWinner = msg.sender;
    }

    function setEthToWin() public payable {
        require(msg.value > currentWinningETH, "Cannot win if eth is less");
        (bool sent,) = currentWinner.call{value : currentWinningETH}("");
        if(sent){
            currentWinningETH = msg.value;
            currentWinner = msg.sender;
        }
    }
}