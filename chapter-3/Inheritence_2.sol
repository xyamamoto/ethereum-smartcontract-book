pragma solidity ^0.4.19;

contract A {
    uint public num = 10;   // 10で固定とします(publicのためアクセス可能)
    function getNum() public view returns (uint) {
        return num;
    }
}

contract B {
    A public a;
    address public addr;

    // 別途作成したAのアドレスをセットします
    function setA(A _a) public {
        // Aにキャストしてセット
        a = A(_a);
        // アドレスのまま保持
        addr = _a;
    }
    // 状態変数numを直接取得
    function aNum() public view returns (uint) {
        return a.num();
        // 10
    }
    // メソッドからnumを取得
    function aGetNum() public view returns (uint) {
        // 10
        return a.getNum();
    }
    // 状態変数 num を直接取得
    function aNum2() public view returns (uint) {
        // 10 (使用時にキャストしてもOK)
        return A(addr).num();
    }
}