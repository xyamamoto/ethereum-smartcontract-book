pragma solidity ^0.4.19;

contract IntSample {
    function division() public pure returns (uint) {
        uint a = 3;
        uint b = 2;
        uint c = a / b * 10;
        return c;
    }

    function divisionLiterals() public pure returns (uint) {
        uint c = 3 / 2 * 10;
        return c;
    }

    function divisionByZero() public pure returns (uint) {
        uint a = 3;
        uint c = a / 0;// 注意：テキストブックと異なり、ここからはエラーが発生しない。
        return c;
    }

    function shift() public pure returns (uint[2]) {
        uint[2] memory a;
        a[0] = 16 << 2;
        a[1] = 16 >> 2;
        return a;
    }
}