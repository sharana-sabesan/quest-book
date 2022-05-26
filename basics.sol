// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract HelloWorld {
  string public greet = "Hello World!";
}

contract stateVariables {
  uint public num; 

  // every function call counts as a transaction
  function get() public view returns (uint){
    return num;
    // reading a variable = no transaction fees
  }

  function set(uint _num) public {
    num = _num;
    // writing/updating a variable = transaction fees
  }
}

contract ifElse {
  // pure = a function that doesn't read or modify the variables of the state
  function foo(uint x) public pure returns (uint) {
    if(x < 10){
      return 0;
    } else if(x < 20) {
      return 1;
    } else{
      return 2;
    }
  }
}
