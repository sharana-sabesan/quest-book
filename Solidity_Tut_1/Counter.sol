//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
//declare version of solidity being used, should be equal to compiler version

//constructor function runs automatically ONCE when contract is deployed
// deploying = a transaction
// view modifier  = read function, not changing any value

contract Counter {
    uint public count = 0;
    // this is a state variable & stored on blockchain itself
    // uint (unsigned integer) = positive integer
    // making the variable public = count function is created for free that allows us to view value of "Count"


    function incrementCount() public {
        count++;
        // this is a write function meaning we have to pay gas since we are changing a value 
    }


}
