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

  function tenary(uint _x) public pure returns (uint) {
    /* if(_x < 20) {
      return 1;
    } 
    return 2;
    */ 

    // shorthand way of writing ^^
    return _x < 20 ? 1 : 2;
  }
}

contract map() {

  // this function helps us get the value, using key
  function get_address(address _addr) public view returns (uint){
    return MyMap[_addr]
    /* mapping(keyType -> valueType)
     * key can be uint, address, or bytes
     * value can be any type including
     *   - another mapping
     *   - array
     */
  }

  // this function helps us set the value to the key
  function set(address _addr, uint _i) public {
    myMap[_addr] = _i;
  }

  // this function resets/deletes the value linked to key value
  function remove(address _addr) public {
    delete myMap[_addr];
  }
}


