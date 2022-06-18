// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
// tells Remix which version of solidity to use ^

// A class aka contract can accept and storfe $$ natively

/* Every user and every program on Ethereum has an account. 
 * An account is identified by an address. An account
 * can do whatever it wants with the $$ it holds.
 */

 /* Using solidity, we can write the logic of how 
  * the program will use the money in the account
  */
contract SmartBankAccount {

    uint totalContractBalance = 0;

    function getContractBalance() public view returns(uint){
        return totalContractBalance;
    }

    mapping(address => uint) balances;
    // using an address, you can find balance of the address/account

    mapping(address => uint) depositTimestamps;
    // to find out when a deposit was made

    function addBalance() public payable {
            // "payable" allows money to be sent as a parameter when function is called

        balances[msg.sender] = msg.value;
        /* Sets user address/account to have a certain 
         * amount of money in the user's account.
         * Use mapping to store what is the balance of 
         * which user!
         */

        /* msg.sender is automatic value which stores address
         * of user who clled the function. msg.value is $$$ 
         * being sent in the function call.
         */

        totalContractBalance = totalContractBalance + msg.value;
        // adds user's balance to total contract balance

        depositTimestamps[msg.sender] = block.timestamp;
        // gives us the time a user made a deposit
    }

    function getBalance(address userAddress) public view returns(uint) {
        uint principal = balances[userAddress];
        // principal = balance of a specified user

        uint timeElapsed = block.timestamp - depositTimestamps[userAddress];
        /* timeElapsed = how much time has passed since the 
         * user put money in the account.
         */

        return principal + uint((principal * 7 * timeElapsed)/ (100 * 365 * 24 * 60 * 60)) + 1;
        // interest of the user's money based on how long it was kept in the bank
        // 0.07% a year
    }
        
}
