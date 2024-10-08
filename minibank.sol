// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SendMoney {
    uint public balanceReceived; 

    function deposit() public payable  {
       balanceReceived += msg.value;
    }

    function getContractBanance() public view returns (uint) {
        return address(this).balance;
    }

    function withDrawToAddress (address payable to) public {
        to.transfer(getContractBanance());
    }

     function withDrawToAll () public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBanance());
    }
}
