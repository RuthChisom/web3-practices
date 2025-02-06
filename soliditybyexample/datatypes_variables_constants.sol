// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Primitives{
    bool public friend = true;
    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint public u = 123; // uint is same as uint256
    int8 public i8 = -1;
    int256 public i256 = 456;
    int public i = -123;  // int is same as int256

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /* In Solidity, the data type byte represent a sequence of bytes. 
    Solidity presents two type of bytes types :

     - fixed-sized byte arrays
     - dynamically-sized byte arrays.
     
     The term bytes in Solidity represents a dynamic array of bytes. 
     It’s a shorthand for byte[] .
    */
    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]

    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000



}

contract Variables{
    // State variables are declared outside a function and stored on the blockchain.
    string public text = "Hello";
    uint public num = 123;

    function doSometing() public view {
        // Local variables are declared inside a function and not saved to the blockchain.
        uint localnum = 456;

        // global variables provides information about the blockchain
        uint256 timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller

    }
}

contract Constants{
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UNIT = 123;
    // use uppercase for constant variables
}

contract Immutable{
    address public immutable myAddr;
    uint public immutable myUint;

    constructor(uint _myUint){
        myAddr = msg.sender;
        myUint = _myUint;
    }
}