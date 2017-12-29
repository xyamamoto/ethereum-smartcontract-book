pragma solidity ^0.4.19;

contract TimeUnitSample {
    uint public startTime;  // 秒を保持

    // 開始
    function start() public {
        // nowはblock.timestampのエイリアス
        startTime = now;
    }
    // 開始から指定分経過したか
    function minutesAfter(uint min) public view returns (bool) {
        if (startTime == 0) return false;
        // 開始前はfalse
        return ((now - startTime) / 1 minutes >= min);
    }
    // 経過秒を取得
    function getSeconds() public view returns (uint) {
        if (startTime == 0) return 0;
        // 開始前は 0
        return (now - startTime);
    }
}