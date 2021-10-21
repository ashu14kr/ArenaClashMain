// To parse this JSON data, do
//
//     final badmintonContestData = badmintonContestDataFromJson(jsonString);

import 'dart:convert';

List<BadmintonContestData> badmintonFromJson(String str) => List<BadmintonContestData>.from(json.decode(str).map((x) => BadmintonContestData.fromJson(x)));

String badmintonToJson(List<BadmintonContestData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BadmintonContestData {
    BadmintonContestData({
        required this.id,
        required this.status,
        required this.matchType,
        required this.totalPoints,
        required this.betCoins,
        required this.winningCoins,
        required this.whoWon,
        required this.whoLose,
        required this.userUidWhoCreated,
        required this.userUidWhoAccepted,
        required this.userWhoCreatedLocation,
        required this.userWhoCreatedContactDetail,
        required this.contestCreatedDate,
        required this.v,
    });

    String id;
    String status;
    String matchType;
    String totalPoints;
    int betCoins;
    int winningCoins;
    String whoWon;
    String whoLose;
    String userUidWhoCreated;
    String userUidWhoAccepted;
    String userWhoCreatedLocation;
    String userWhoCreatedContactDetail;
    String contestCreatedDate;
    int v;

    factory BadmintonContestData.fromJson(Map<String, dynamic> json) => BadmintonContestData(
        id: json["_id"],
        status: json["status"],
        matchType: json["matchType"],
        totalPoints: json["totalPoints"],
        betCoins: json["betCoins"],
        winningCoins: json["winningCoins"],
        whoWon: json["whoWon"], 
        whoLose: json["whoLose"],
        userUidWhoCreated: json["userUidWhoCreated"],
        userUidWhoAccepted: json["userUidWhoAccepted"],
        userWhoCreatedLocation: json["userWhoCreatedLocation"],
        userWhoCreatedContactDetail: json["userWhoCreatedContactDetail"],
        contestCreatedDate: json["contestCreatedDate"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "matchType": matchType,
        "totalPoints": totalPoints,
        "betCoins": betCoins,
        "winningCoins": winningCoins,
        "whoWon": whoWon,
        "whoLose": whoLose,
        "userUidWhoCreated": userUidWhoCreated,
        "userUidWhoAccepted": userUidWhoAccepted,
        "userWhoCreatedLocation": userWhoCreatedLocation,
        "userWhoCreatedContactDetail": userWhoCreatedContactDetail,
        "contestCreatedDate": contestCreatedDate,
        "__v": v,
    };
}
