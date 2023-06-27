//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Variables {
    //state variables are stored on the blockchain
    uint public myUint = 1;
    uint256 public myUint256 = 1;
    //uint and uint256 are the same. 256 bytes. 

    uint8 public myUint8 = 1; 
    // 8 bytes

    int256 public myInt8 = 2;
    // signed integer(can be negative) of 256 bytes

    /* There is different sized ints and uints because data size matters on blockchain 
     * and affects the price of gas.
    */ 

    string public myString = "Hello World!";
    bytes32 public myBytes32 = "Hello, world!"; 
    // bytes32 = string gets treated as array

    address public myAddress =  0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47;
    // address = username on the blockchain, or can be location of smartContract

    struct MyStruct {
        uint256 myUint256;
        string myString;
        // structs allow you to create complex data types
    }

    MyStruct public struct_1 = MyStruct(2, "ur mom");
    //you have to create an instance of your struct



    //local variables exist inside functions within the contract
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
        //this variable ccan only be accessed inside of this function, not from outside of the function
        // pure = does not modify any info, just fetches information
    }

}
