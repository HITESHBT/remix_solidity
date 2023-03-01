//SPDX-License-Identifier: MIT

//pragma line tells our pre compiler what 
//kind of compiler version this my contract was written for.
pragma solidity 0.8.14;

contract MyContract{

    string public ourString = "Hello World on Earth";
    

    function updateOurString(string memory _updateString) public {
        ourString = _updateString;
    }

}
//web3.utils.sh3("updateOurString(string)") : gives the keccak hash of the first 8 digits and provides with the function signature.