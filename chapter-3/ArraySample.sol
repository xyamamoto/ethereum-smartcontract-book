pragma solidity ^0.4.19;

contract ArraySample {
    uint[5] public fArray = [uint(10), 20, 30, 40, 50]; // 固定長配列の宣言と初期化
    uint[] public dArray;       // 可変長配列の宣言

    function getFixedArray() public pure returns (uint[5]) {
        uint[5] memory a;
        // 長さ 5 の固定長配列を宣言
        // メソッド内はこの形では初期化できません
        // uint[5] b = [uint(1), 2, 3, 4, 5]
        for (uint i = 0; i < a.length; i++) {// 初期化
            a[i] = i + 1;
        }
        // [1, 2, 3, 4, 5]を返す
        return a;
    }

    function getFixedArray2() public view returns (uint[5]) {
        // 状態変数で初期化
        uint[5] storage b = fArray;
        // [10, 20, 30, 40, 50]を返す
        return b;
    }

    function pushFixedArray(uint x) public view returns (uint) {
        // 以下はコンパイルエラーとなります
        // fArray.push(x);
        return fArray.length;
    }

    function pushDArray(uint x) public returns (uint) {
        // 引数で渡された要素を追加し、更新後の要素数を返す
        return dArray.push(x);
    }

    function getDArrayLength() public view returns (uint) {
        // 可変長配列の現在のサイズを返す
        return dArray.length;
    }

    function initDArray(uint len) public {
        dArray.length = len;
        // 可変長配列のサイズを変更
        for (uint i = 0; i < len; i++) {// 初期化
            dArray[i] = i + 1;
        }
    }

    function getDArray() public view returns (uint[]) {
        // 可変長配列も返せます
        return dArray;
    }

    function delDArray() public returns (uint) {
        // 可変長配列を削除
        delete dArray;
        // 0 を返す
        return dArray.length;
    }

    function delFArray() public returns (uint) {
        // 固定長配列を削除。各要素は0になります
        delete fArray;
        // 長さは 5 のまま
        return fArray.length;
    }
}