// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SmartContractWallet {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function transfer(
        address payable _to,
        uint256 _ammount,
        bytes memory _payload
    ) public returns (bytes memory) {
        require(msg.sender == owner, "You are not the owner");
        (bool success, bytes memory returnData) = _to.call{value: _ammount}( 
            _payload
        );
        require(success, "Call is not successful");
        return returnData;
    }
}
