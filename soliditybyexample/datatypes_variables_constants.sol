// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Primitives{
    bool public friend = true;
    /*
    uint stands for unsigned integer, meaning non negative integers
        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint public u = 123; // uint is same as uint256

    /*
    Negative numbers are allowed for int types.
    int256 ranges from -2 ** 255 to 2 ** 255 - 1
    int128 ranges from -2 ** 127 to 2 ** 127 - 1
    */
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

     uint public num;

    // send a transaction to write to a state variable
    function set(uint _num) public {
        price = _num;
    }

    // read from a state variable without sending transaction
    function get() public view returns (uint){
        return  price;
    }
}

/* Constants are variables that cannot be modified.
Their value is hard coded and using constants can save gas cost. */
contract Constants{
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UNIT = 123;
    // use uppercase for constant variables
}

// Immutable variables are like constants. Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
contract Immutable{
    address public immutable myAddr;
    uint public immutable myUint;

    constructor(uint _myUint){
        myAddr = msg.sender;
        myUint = _myUint;
    }
}