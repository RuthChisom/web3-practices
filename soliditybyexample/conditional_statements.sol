// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract DaysSpentInAMonth{
    function spent(uint256 day) public pure returns ( string memory)  {
        if (day < 10){
            return "The month is still young";
        } else if (day <=15) {
            return "We still have a few days left to make the month  a memorable one";
        } else {
            return "Sope Otilo!";
        }
    }

    //tenary method - my favorite method ...because this life no suppose hard
    function spent2(uint256 y) public pure returns (string memory){
        return y < 20 ? "The month is still young" : "Sope Otilo!";
    }
}

