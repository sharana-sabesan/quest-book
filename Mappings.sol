//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Mappings {
    // Mappings allow you to store data with key-value pairs
    mapping(uint => string) public names;

    struct Book {
        string title;
        string author;
    }
    // Think of a struct as object. 

    mapping(uint => Book) public books;

    // Nested Mappings
    mapping(address => mapping(uint => Book)) public myBooks; 
    /* The above mapping will help a user find books belonging to them
     * hence why they enter in an their user address. The key
     * is the user's address while the value is another mapping of
     * a specific database of books linked to the user. 
     */  
    

    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
        // 3 = key, Carl = value
    }

    function addBooks(
        uint _id, 
        string memory _title, 
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
        // above you are creating an instance of Book object
    }

    function addMyBook(
        uint _id, 
        string memory _title, 
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
        // above you are creating an instance of Book object
        // msg.sender = a global variable that Solidity which defines the person calling the contract
        // msg.sender = key here. 

    }

}
