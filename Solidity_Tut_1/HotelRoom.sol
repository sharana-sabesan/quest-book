//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// OBJECTIVE: Booking a hotel room & opening it

contract HotelRoom {
    //CONCEPT: enums
    enum Statuses { 
        Vacant, 
        Occupied 
    }
    // enums are good for keeping track of states
    // in the "console" the options are defined by 0 and 1. 
    // 0 = Vacant | 1 = Occupied

    Statuses public currentStatus; 
    // treat enums like objects!

    //CONCEPT: events -> to get alaerts & log every time someone books room
    event Occupy(address _occupant, uint _value);


    //CONCEPT: Ether payments
    address payable public owner;
    // payable address of person who created contract AKA hotel owner
    // "payable" = a modifier that allows the address to recieve payment

    constructor() {
        owner = payable(msg.sender);
        // makes sure owner = the creator of the contract

        currentStatus = Statuses.Vacant;
    }

    //CONCEPT: Modifiers
    modifier onlyWhileVacant {
        require(currentStatus == Statuses.Vacant, "Currently occupied");
        _;
        //Check if status is vacant
        // like an if statement. 2nd argument prints a message to user to let them know
        
        // This modifier makes sure room is vacant for user to even call book function
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough ether provided"); 
        _;
        // Check if consumer pays the right price
    }

    function book() public payable onlyWhileVacant costs(2 ether){
        currentStatus = Statuses.Occupied;
        // sets room as occupied since you are booking it

        //owner.transfer(msg.value);
        // transfer -> sends crypto to recipient
        // msg.value is a value you enter in when you call book function
        // pay owner to book hotel room

        // it's better to use call function OVER transfer: 
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(true);
        /* usually you use call to send a message to a specific user hence
         * why we have an empty string above. But you can use it to send payments too.
         * (bool sent) gives us the status of the transaction to determine
         * if it was sent or not and (bytes memory data) tells us any data that 
         * came back. And then the reuqire statement makes sure, only if the
         * payment was sent, then can the user actually occupy the room ->
         * the event gets emitted. 
         */

        emit Occupy(msg.sender, msg.value);
        // sends alert to contract creator letting them know occupant address * how much they paid
        // also logs

    }
}
