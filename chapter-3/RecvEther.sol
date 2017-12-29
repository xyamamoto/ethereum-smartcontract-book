pragma solidity ^0.4.19;

contract RecvEther {
    address public sender;
    uint public recvEther;

    function() payable public {
        sender = msg.sender;
        recvEther += msg.value;
    }
}