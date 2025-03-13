// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Mapping { // mappings are not iterable

    // mapping from address to uint
    mapping(Address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        // mapping ALWAYS returns a value. If not set, it returns the default
        return myMap[_addr];
    }
    function set(address _addr, uint _i) public {
        // update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // reset the address to the default value
        delete myMap[_addr];
    }
}

contract nestedMapping { // mapping from address to another mapping
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // you can get values from a nested maping even when it's not initialized
        return nested[_addr1][_i];
    }
    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }
    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}