pragma solidity ^0.4.19;

contract AddressSample {
    // 無名関数(送金されると実行される) payableを指定することでEtherの受付が可能
    function() payable public {}

    function getBalance(address _target) public view returns (uint) {
        if (_target == address(0)) {// _targetが0の場合は、コントラクト自身のアドレスをセットします
            _target = this;
        }
        // 残高を返します
        return _target.balance;
    }

    // 以降の送金メソッドを実行する前に、このコントラクトに対して送金しておいてください
    // 引数で指定されたアドレスにtransferを使用して送金する
    function transfer(address _to, uint _amount) public {
        // 失敗すると例外が発生します
        _to.transfer(_amount);
    }

    // 引数で指定されたアドレスにsendを使用して送金
    function send(address _to, uint _amount) public {
        if (!_to.send(_amount)) {// sendを使用する場合は戻り値をチェックしましょう
            revert();
        }
    }

    // 引数で指定されたアドレスにcallを使用して送金
    function call(address _to, uint _amount) public {
        if (!_to.call.value(_amount).gas(1000000)()) {// callも戻り値をチェックしましょう
            revert();
        }
    }

    // 引き出しパターン(transfer)
    function withdraw() public {
        // メソッド実行者を宛先にします
        address to = msg.sender;
        // 全額送金します
        to.transfer(this.balance);
    }
    // 引き出しパターン(call)
    function withdraw2() public {
        // メソッド実行者を宛先にします
        address to = msg.sender;
        if (!to.call.value(this.balance).gas(1000000)()) {// 全額送金します
            revert();
        }
    }
}