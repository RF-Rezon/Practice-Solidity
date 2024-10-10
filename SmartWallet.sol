// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SmartContractWallet {
    address payable owner;

    mapping (address => uint) public allowance;
    mapping (address => bool) public isAllowedToSend;

    constructor() {
        owner = payable(msg.sender);
    }

    function setAllowance(address _for, uint _ammount) public {
         require(msg.sender == owner, "You are not the owner");
         allowance[msg.sender] = _ammount;
         if(_ammount > 0){
            isAllowedToSend[_for] = true;
         }else{
            isAllowedToSend[_for] = false;
         }
    }

    function transfer(
        address payable _to,
        uint256 _ammount,
        bytes memory _payload
    ) public returns (bytes memory) {
       if(msg.sender != owner){
        require(isAllowedToSend[msg.sender], "You are not allowed to send anything from this smart contract.");
        require(allowance[msg.sender] >= _ammount, "You are not allowed to send anything from this smart contract.");

        allowance[msg.sender] -= _ammount;
       }
        (bool success, bytes memory returnData) = _to.call{value: _ammount}( 
            _payload
        );
        require(success, "Call is not successful");
        return returnData;
    }
}
