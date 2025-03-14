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

    // Remove an array element by shifting elements from right to left
    uint256[] public arr;

    function remove1(uint256 _index) public{
        require(_index < arr.length, "index out of bounds");
         for (uint256 i = _index; i<arr.length - 1; i++){
            arr[i] = arr[i+1];
         }
         arr.pop();
    }

    function testShift() external {
        arr = [10, 20, 30, 40, 50];
        remove(2); //[10, 20, 40, 50]
        assert(arr[0] == 10);
        assert(arr[1] == 20);
        assert(arr[2] == 40);
        assert(arr[3] == 50);
        assert(arr.length == 4);
    }

    // Remove an element by copying last element into the place to remove
    function remove2(uint256 index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    function testShift2() public {
        arr = [11, 22, 33, 44];
        remove2(1); //[11, 33, 44]
        assert(arr.length == 3);
        assert(arr[0] == 11);
        assert(arr[1] == 33);
        assert(arr[2] == 44);

        remove2(2);//[11, 33]
        assert(arr.length == 2);
        assert(arr[0] == 11);
        assert(arr[1] == 33);
    }