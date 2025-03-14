// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Array {
    // several ways ti initialize an array
    uint256[] public arr;
    uint256[] public arr2 = [1,2,3];
    uint256[10] public myFixedSizeArr; //all elements initialize to 0

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    //you are allowed to return the entire arrar, but avoid that for arrays that grow indefinitely
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    function pop() public{
        arr.pop(); //removes last element
    }

    function getLength() public view returns (uint256){
        return arr.length;
    }

    function remove(uint256 index) public {
        delete arr[index]; //resets the value at index to default(o), so array length stays the same
    }

    function examples() external pure {
        uint256[] memory a = new uint256[](5); //create array in memory, must have fixed length
        uint256[][] memory b = new uint256[][](2);
        for (uint256 i = 0; i < b.length; i++){
            b[i] = new uint256[](3); //create a nested array in memory
        }
        b[0][0] = 1;
        b[0][1] = 2;
        b[0][2] = 3;
        b[1][0] = 4;
        b[1][1] = 5;
        b[1][2] = 6;
    }
}