/* Build a "Zombie Factory" to build an army of zombies.
Our factory will maintain a database of all zombies in our army.
Our factory will have a function for creating new zombies.
Each zombie will have a random and unique appearance. 
The zombie's appearance will be based on its "Zombie DNA". Zombie DNA is simple — it's a 16-digit integer, like: 8356281049284737
The first 2 digits map to the zombie's head type, the second 2 digits to the zombie's eyes, etc.
For now, our zombies can have only 7 different types of heads (even though 2 digits allow 100 possible options)
For example, the first 2 digits of our example DNA above are 83. To map that to the zombie's head type, we do 83 % 7 + 1 = 7. So this Zombie would have the 7th zombie head type.
*/

pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    // declare our event here to communicate that something happened on the blockchain to the app front-end
    event NewZombie(uint zombieId, string name,uint dna);


    uint dnaDigits = 16;  // Our Zombie DNA is going to be determined by a 16-digit number.
    uint dnaModulus = 10 ** dnaDigits;

    // each zombie will have multiple properties
    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies; //to store an army of zombies 

    function _createZombie(string memory _name, uint _dna) private {
        /* create new zombie struct and add to the zombies array
         we're going to need the zombie's id; array.push() returns a uint of the new length of the array
         - and since the first item in an array has index 0, array.push() - 1 will be the index of the new zombie.
        */
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        // fire event to let our front-end know every time a new zombie was created, so the app can display it.
        emit NewZombie(id, _name, _dna);

    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str))); //generate a pseudo-random hexadecimal, typecast it as a uint, and finally store the result in a uint 
        return rand % dnaModulus; //To make sure our Zombie's DNA is only 16 characters
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
