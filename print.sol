// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract HelloWorld {
  string public greet = "Hello World!";
  uint public num;

  //every function call counts as a transaction
  function get() public view returns (uint){
    return num;
    // reading a variable = no transaction fees
  }

  function set(uint _num) public {
      num = _num;
      // writing a variable = transaction fees
  }
  
}
