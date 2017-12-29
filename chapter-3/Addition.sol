pragma solidity ^0.4.19;

contract Addition {

    int num = 0;

    function add(int a) public {
        num += a;
    }

    function get() public constant returns (int _num){
        _num = num;
    }
}