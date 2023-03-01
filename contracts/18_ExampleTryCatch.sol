//SPDX-License-Identifier:MIT
pragma solidity 0.8.15;

contract willThrow
{
    error NotAllowedError(string);
    function aFunction() public pure{
        //require(false,"error message");
        //assert(false);
        revert NotAllowedError("You are not allowed");
    }
}

contract ErrorHandling{
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogByte(bytes lowLevelData);
    function catchTheError() public{
        
        willThrow will=new willThrow();
        try will.aFunction(){
            //....
        }
        catch Error(string memory reason){
            //....
            emit ErrorLogging(reason); ///// for require
        }
        catch Panic(uint errorCode){     /// for assert 
            emit ErrorLogCode(errorCode);
        }
        catch(bytes memory lowLevelData)/// for custom error of the user 
        {
            emit ErrorLogByte(lowLevelData);
        }
    }
}