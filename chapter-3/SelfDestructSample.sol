pragma solidity ^0.4.19;

contract SelfDestructSample {
    address public owner = msg.sender; // コントラクトをデプロイしたアドレスをオーナーとします

    // 送金を受け付けます(close()後に呼ぶと送金もできなくなります)
    function() payable public {}

    // コントラクトを破棄するメソッドです
    function close() public {
        // 送信者がオーナーでない場合は例外を投げます
        if (owner != msg.sender) revert();
        // コントラクトを破棄します
        selfdestruct(owner);
    }

    // コントラクトの残高を返すメソッドです
    function getBalance() public view returns (uint) {// close()後に呼ぶとエラーになります
        return this.balance;
    }
}