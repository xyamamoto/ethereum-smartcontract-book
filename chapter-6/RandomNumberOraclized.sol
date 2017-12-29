pragma solidity ^0.4.19;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract RandomNumberOraclized is usingOraclize {
    uint public randomNumber;
    bytes32 public request_id;

    function RandomNumberOraclized() public {
        // (1) Oraclize Address Resolver の読み込み
        // <OARアドレスを指定。deterministic OAR の場合、この行の指定は必要ない
        OAR = OraclizeAddrResolverI(0x45831C2e2e081F7373003502D1D490e62b09A0dD);
    }

    function request() public {
        // (2) OraclizeへWolframAlphaによる計算を依頼
        // デバッグのため、request_idにOraclizeへの処理依頼番号を保存しておきます
        request_id = oraclize_query("WolframAlpha", "random number between 1 and 6");
    }

    // (3) Oraclize側で外部処理が実行されると、この__callback関数を呼び出してくれる
    function __callback(bytes32 request_id, string result) public {
        if (msg.sender != oraclize_cbAddress()) {
            revert();
        }

        // (4) 実行結果resultをdrawnNumberへ保存
        randomNumber = parseInt(result);
    }
}