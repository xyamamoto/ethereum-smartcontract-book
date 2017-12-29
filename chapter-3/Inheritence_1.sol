pragma solidity ^0.4.19;

contract A {
    uint public a;

    function setA(uint _a) public {
        a = _a;
    }

    function getData() public view returns (uint) {
        // a のまま返します
        return a;
    }
}

contract B is A {// B は、Aのサブコントラクト
    function getData() public view returns (uint) {
        // a を 10倍して返します
        return a * 10;
    }
}

contract C {
    A[] public c;           // データ型をコントラクトAとした可変長配列 c を宣言
    // コントラクトの作成
    function makeContract() public {
        // c の長さを 2 にします
        c.length = 2;
        // コントラクトAを作成
        A a = new A();
        // 1をセット
        a.setA(1);
        // 配列の一つ目の要素に代入
        c[0] = a;
        // コントラクトBを作成
        B b = new B();
        // 同じく 1 をセット
        b.setA(1);
        // 配列の二つ目の要素に代入
        c[1] = b;
    }
    // コントラクトのデータを返す
    function getData() public view returns (uint, uint) {
        if (c.length == 2) {// コントラクト作成済みであること
            // (1, 10)を返す
            return (c[0].getData(), c[1].getData());
        }
    }
}