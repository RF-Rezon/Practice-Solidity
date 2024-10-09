// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Mapping {
    mapping (address => uint) public blanceReceived;

    function sendMoney () public payable {
        blanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance; 
    }

    function withDrawMoney(address payable _to) public {
        uint balanceToSendOut = blanceReceived[msg.sender]; 
        blanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
    }
}       
