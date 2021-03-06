pragma solidity ^0.4.19;

contract RandomNumber {
    address owner;
    uint numberMax;

    struct draw {
        uint blockNumber;
    }

    struct draws {
        uint numDraws;
        mapping(uint => draw) draws;
    }

    mapping(address => draws) requests;

    event ReturnNextIndex(uint _index);

    event ReturnDebug(bytes32 _seed, uint _drawnNumber);

    function RandomNumber(uint _max) public {
        owner = msg.sender;
        numberMax = _max;}

    function request(uint _dummy) returns (uint) {
        uint _nextIndex = requests[msg.sender].numDraws;
        requests[msg.sender].draws[_ nextIndex].blockNumber = block.number;
        requests[msg.sender].numDraws = _nextIndex + 1;
        ReturnNextIndex(_nextIndex);
        return _nextIndex;}

    function getNum() constant returns (uint num){
        return requests[msg.sender].numDraws;
    }

    function get(uint _index) constant returns (int status, bytes32 blockhash, bytes32 seed, uint drawnNumber){
        if (_index >= requests[msg.sender].numDraws) {
            return (- 2, 0, 0, 0);
        } else {
            uint _nextBlockNumber = requests[msg.sender].draws[_index].blockNumber + 1;
            if (_nextBlockNumber >= block.number) {
                return (- 1, 0, 0, 0);
            } else {
                bytes32 _blockhash = block.blockhash(_nextBlockNumber);
                bytes32 _seed = sha256(_blockhash, msg.sender, _index);
                uint _drawnNumber = uint(_seed) % numberMax + 1;
                return (0, _blockhash, _seed, _drawnNumber);
            }
        }
    }
}
