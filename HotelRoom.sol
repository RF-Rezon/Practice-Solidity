
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract HotelRoom {
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant() {
        //Check Status
        require(currentStatus == Statuses.Vacant, "Status is Occupied.");
        _;
    }

    modifier checkPrice(uint _amount) {
        //Check Price
        require(msg.value >= _amount, "Not enough ether.");
        _;
    }

    function book() public payable onlyWhileVacant checkPrice(2 ether){
        currentStatus = Statuses.Occupied;

        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(true);

        emit Occupy(msg.sender, msg.value);
    }
}
