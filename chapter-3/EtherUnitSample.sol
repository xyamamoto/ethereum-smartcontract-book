pragma solidity ^0.4.19;

contract EtherUnitSample {
    function() payable public {} // Ether受け取り用メソッド

    // getEther実行前にこのコントラクトに対して1 ether 送金してください
    function getEther() public view returns (
        uint _wei, uint _szabo,
        uint _finney, uint _ether) {
        uint amount = this.balance;   // 1000000000000000000
        _wei = amount / 1 wei;        // 1000000000000000000
        _szabo = _wei / 1 szabo;      // 1000000
        _finney = _wei / 1 finney;    // 1000
        _ether = _wei / 1 ether;      // 1
    }
}