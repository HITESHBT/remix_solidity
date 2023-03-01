//SPDX-License-Identifier: MIT
pragma solidity 0.7.0;
contract ExampleExceptionRequire{
    mapping(address=>uint) public balanceReceived;
    function receiveMoney() public payable{
        balanceReceived[msg.sender]+=msg.value;
    }
    function withdrawMoney(address payable _to, uint _amount) public{
        require(_amount<=balanceReceived[msg.sender], "not enough funds, aborting");
        //assert(false); is the syntax, it creates a paic mode and uses up all the resources(gas);
        balanceReceived[msg.sender]-=_amount;
        _to.transfer(_amount);
    }
}