pragma solidity ^0.4.19;

contract BlockHashTest {
    function getBlockHash(uint _blockNumber) public view returns (bytes32 blockhash, uint blockhashToNumber){
        bytes32 _blockhash = block.blockhash(_blockNumber);
        uint _blockhashToNumber = uint(_blockhash);
        return (_blockhash, _blockhashToNumber);
    }
}