//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// OBJECTIVE: The below code gets a secret and makes sure only the owner can read the secret

contract Ownable {
    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

// CONCEPT: Inheritance - inherit properties from parent contract 
// The below contract inherits the ownership properties of the OWNABLE contract
contract Inheritance_And_Factories is Ownable {
    address secretVault; 

    constructor(string memory _secret) {
        // CONCEPT: Factories - deploy other contracts within a smart contract
        SecretVault _secretVault = new SecretVault(_secret);
        // we are deploying/calling the secret vault contract within another contract

        secretVault = address(_secretVault);
        // address of secret vault contract

        super;
        // the super command calls the constructor from the parent contract: Ownable!
    }

    function getSecret() public view onlyOwner returns(string memory){
        return SecretVault(secretVault).getSecret();
    }
}
