pragma solidity ^0.4.0;

contract sendether
{
    uint value;
    address  A = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    function send(uint _value) external payable {
        value = _value;
        A.transfer(value);

    }
}