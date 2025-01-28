import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
import Int "mo:base/Int";
import Debug "mo:base/Debug";

actor Token {
    var owner : Principal = Principal.fromText("wuip4-5h3lr-lywfq-tbshz-twttx-bnmpk-pvkb2-bccak-goscy-gtoou-qqe");
    var totalSupply : Nat = 1000000000;
    var symbol: Text = "SWARNA";

    var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);
    balances.put(owner, totalSupply);

    public query func balanceOf(who: Principal) : async Nat {

        let balance : Nat = switch (balances.get(who)) {
            case null 0;
            case (?result) result;
        };

        return balance;
    };

    public query func getSymbol() : async Text {
        return symbol;
    };

    public shared(msg) func payOut() : async Text {

        if (balances.get(msg.caller)==null) {
            // Debug.print(debug_show(msg.caller));
            let amount = 10000;
            balances.put(msg.caller, amount);
            return "Success";
        } else {
            return "You already claimed!";
        }
    }
}