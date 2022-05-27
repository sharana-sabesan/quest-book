// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract HelloWorld {
  string public greet = "Hello World!";
}

contract StateVariables {
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

contract IfElse {
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

  function enary(uint _x) public pure returns (uint) {
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

contract Arrays() {
  uint[] public arr //declared
  uint[] public arr2 = [1, 2, 3] // initialized
  uint[10] public myFixedSizeArr; //fixed size array

  // function gets an element from an array
  function get(uint i) public view returns(uint) {
    return arr[i];
  }

  // function adds 1 element to an array
  function push(uint i) public {
    arr.push(i)
  }

  // function removes 1 element from array
  function pop() public {
    arr.pop();
  }

  // function removes specific element from array
  function remove(uint index) public {
    delete arr[index];
  }

  // functions gets array length
  function getLength() public view returns (uint) {
    return arr.length
  }

  // function returns entire array, but not arrays indefinitely grow in length
  function getArr public view returns (uint[] memory) {
    /* memory is a keyword used to store data for the   
     * execution of a contract. It holds functions 
     * argument data and is wiped after execution
    */
    return arr;
  }

  // function that deletes element without creating gap in array
  function removeCompact(uint index) public {
    // Move the last element into the place to delete
    arr[index] = arr[arr.length - 1];

    // Remove the last element
    arr.pop();
  }
}

