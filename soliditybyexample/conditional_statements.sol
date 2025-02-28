// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/utils/Strings.sol"; // Import OpenZeppelin's Strings library

contract ConditionalStatements{
    //If/Else
    function daysSpentInAMonth(uint256 day) public pure returns ( string memory)  {
        if (day < 10){
            return "The month is still young";
        } else if (day <=15) {
            return "We still have a few days left to make the month  a memorable one";
        } else {
            return "Sope Otilo!";
        }
    }

    //tenary method - my favorite method ...because this life no suppose hard
    function daysSpentInAMonth2(uint256 y) public pure returns (string memory){
        return y < 20 ? "The month is still young" : "Sope Otilo!";
    }

    function happyBirthday(uint cake) public pure returns (string memory) {
        // for loop
        string memory message = "";

        for (uint i = 1; i <= cake; i++) {
            if (i == 5) {
                return string(abi.encodePacked("Haba! You can't have more than 4 cakes in a day!! Come back tomorrow Ojukokoro!!!"));
            }
            message = string(abi.encodePacked(message, "Happy Birthday Champ! Here's your cake ", Strings.toString(i), "--- ||\n\n\n"));
        }

        return message;

        // while loop
        // uint j;
        // while (j<5) {
        //     j++;
        // }
        // return j;

    }
}

