// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract RequireContract {
    // uint public totalMoney;

    mapping(address => uint256) totalMoney;

    function addMoney(uint256 _money) public {
        require(_money > 50, "Ammount low");
        totalMoney[msg.sender] += _money;
    }
    function getMoney() public view returns (uint){
        return totalMoney[msg.sender];
    }
}
