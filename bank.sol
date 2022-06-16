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

    function addBalance(address userAddress, uint amount) public payable {
        balances[userAddress] = amount;
        // sets user address/account to have a certain 
        // amount of money in the user's account

        totalContractBalance = totalContractBalance + amount;
        // adds user's balance to total contract balance
    }
        
}
