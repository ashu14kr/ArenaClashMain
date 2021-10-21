// To parse this JSON data, do
//
//     final currentBalance = currentBalanceFromJson(jsonString);

import 'dart:convert';

CurrentBalance currentBalanceFromJson(String str) => CurrentBalance.fromJson(json.decode(str));

String currentBalanceToJson(CurrentBalance data) => json.encode(data.toJson());

class CurrentBalance {
    CurrentBalance({
        required this.id,
        required this.amount,
        required this.v,
    });

    String id;
    int amount;
    int v;

    factory CurrentBalance.fromJson(Map<String, dynamic> json) => CurrentBalance(
        id: json["_id"],
        amount: json["amount"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "amount": amount,
        "__v": v,
    };
}
