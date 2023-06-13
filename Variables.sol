//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Arrays {
    //Arrays
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["apple", "banana", "strawberry"];
    string[] values;
    uint256[][] public array2D = [[1,2,3],[4,5,6]];
    //2D array is an array inside another array

    function addValue(string memory _value) public {
        values.push(_value);
        // "push" adds new item into array to end of the array
        // "memory" = temprorary storage location to keep _value
    }

    function valueCount() public view returns(uint) {
        return values.length;
        // returns size of values array
    }
}
