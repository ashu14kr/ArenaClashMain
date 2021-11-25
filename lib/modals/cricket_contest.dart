// To parse this JSON data, do
//
//     final cricketContestData = cricketContestDataFromJson(jsonString);

import 'dart:convert';

List<CricketContestData> cricketContestDataFromJson(String str) => List<CricketContestData>.from(json.decode(str).map((x) => CricketContestData.fromJson(x)));

String cricketContestDataToJson(List<CricketContestData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CricketContestData {
    CricketContestData({
        required this.id,
        required this.status,
        required this.matchType,
        required this.totalOvers,
        required this.betCoins,
        required this.winningCoins,
        required this.whoWon,
        required this.whoLose,
        required this.userlat,
        required this.userlng,
        required this.userUidWhoCreated,
        required this.userUidWhoAccepted,
        required this.createrName,
        required this.acceperName,
        required this.userWhoCreatedLocation,
        required this.userWhoCreatedContactDetail,
        required this.contestCreatedDate,
        required this.v,
    });

    String id;
    String status;
    String matchType;
    String totalOvers;
    double betCoins;
    double winningCoins;
    String whoWon;
    String whoLose;
    double userlat;
    double userlng;
    String userUidWhoCreated;
    String userUidWhoAccepted;
    String createrName;
    String acceperName;
    String userWhoCreatedLocation;
    String userWhoCreatedContactDetail;
    String contestCreatedDate;
    int v;

    factory CricketContestData.fromJson(Map<String, dynamic> json) => CricketContestData(
        id: json["_id"],
        status: json["status"],
        matchType: json["matchType"],
        totalOvers: json["totalOvers"],
        betCoins: json["betCoins"].toDouble(),
        winningCoins: json["winningCoins"].toDouble(),
        whoWon: json["whoWon"],
        whoLose: json["whoLose"],
        userlat: json["userlat"].toDouble(),
        userlng: json["userlng"].toDouble(),
        userUidWhoCreated: json["userUidWhoCreated"],
        userUidWhoAccepted: json["userUidWhoAccepted"],
        createrName: json["createrName"],
        acceperName: json["acceperName"],
        userWhoCreatedLocation: json["userWhoCreatedLocation"],
        userWhoCreatedContactDetail: json["userWhoCreatedContactDetail"],
        contestCreatedDate: json["contestCreatedDate"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "matchType": matchType,
        "totalOvers": totalOvers,
        "betCoins": betCoins,
        "winningCoins": winningCoins,
        "whoWon": whoWon,
        "whoLose": whoLose,
        "userlat": userlat,
        "userlng": userlng,
        "userUidWhoCreated": userUidWhoCreated,
        "userUidWhoAccepted": userUidWhoAccepted,
        "createrName": createrName,
        "acceperName": acceperName,
        "userWhoCreatedLocation": userWhoCreatedLocation,
        "userWhoCreatedContactDetail": userWhoCreatedContactDetail,
        "contestCreatedDate": contestCreatedDate,
        "__v": v,
    };
}
