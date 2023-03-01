//SPDX-License-Identifier:MIT
pragma solidity 0.8.15;
contract Sender{
    receive() external payable{}
    //transfer function shows error because it has to write in the memory of balancerceived variable as gas gets extinguished
    function withdrawTransfer(address payable _to) public{
        _to.transfer(10);
    }
    //send function returns a boolean value : 0 for false 1 for true
    function withdrawSend(address payable _to) public{
       bool isSent= _to.send(10);
       require(isSent,"the sending was unsuccessful");
    }
}
contract ReceiverNoAction{
    function balance() public returns(uint)
    {
        return address(this).balance;
    }
    receive() external payable{}
}
contract ReceiverAction{
    uint public balanceReceived;
    receive() external payable{
        balanceReceived+=msg.value;
    }
    function balance() public returns(uint)
    {
        return address(this).balance;
    }
}
//extrenal calls if we knw thw smart contract
//internal calls if we dont know the smart contract
