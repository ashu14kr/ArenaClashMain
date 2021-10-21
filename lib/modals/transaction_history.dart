// To parse this JSON data, do
//
//     final transactionHistory = transactionHistoryFromJson(jsonString);

import 'dart:convert';

List<TransactionHistory> transactionHistoryFromJson(String str) => List<TransactionHistory>.from(json.decode(str).map((x) => TransactionHistory.fromJson(x)));

String transactionHistoryToJson(List<TransactionHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionHistory {
    TransactionHistory({
        required this.id,
        required this.user,
        required this.status,
        required this.requestId,
        required this.senderName,
        required this.paymentCreated,
        required this.processedOn,
        required this.amount,
        required this.v,
    });

    String id;
    String user;
    String status;
    String requestId;
    String senderName;
    String paymentCreated;
    String processedOn;
    int amount;
    int v;

    factory TransactionHistory.fromJson(Map<String, dynamic> json) => TransactionHistory(
        id: json["_id"],
        user: json["user"],
        status: json["status"],
        requestId: json["requestId"],
        senderName: json["senderName"],
        paymentCreated: json["paymentCreated"],
        processedOn: json["processedOn"],
        amount: json["amount"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "status": status,
        "requestId": requestId,
        "senderName": senderName,
        "paymentCreated": paymentCreated,
        "processedOn": processedOn,
        "amount": amount,
        "__v": v,
    };
}
