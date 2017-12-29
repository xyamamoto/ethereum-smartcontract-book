pragma solidity ^0.4.19; // (1) バージョンプラグマ

// (2) コントラクトの宣言
contract HelloWorld {

    // (3) 状態変数の宣言
    string public greeting;

    // (4) コンストラクタ
    function HelloWorld(string _greeting) public {
        greeting = _greeting;
    }

    // (5) メソッドの宣言
    function setGreeting(string _greeting) public {
        greeting = _greeting;
    }

    function say() public constant returns (string)  {
        return greeting;
    }
}