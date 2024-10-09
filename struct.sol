// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SendMoney {

    struct Details {
        address whoSendTheMoney;
        uint ammountOfTheMoney;
    }

    Details public details; 

    function sendMoney() public payable {
        details = Details(msg.sender, msg.value); // Assign values to the struct
    }
}
