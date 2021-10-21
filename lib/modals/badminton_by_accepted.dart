// To parse this JSON data, do
//
//     final badmintonContestByAccepted = badmintonContestByAcceptedFromJson(jsonString);

import 'dart:convert';

List<BadmintonContestByAccepted> badmintonContestByAcceptedFromJson(String str) => List<BadmintonContestByAccepted>.from(json.decode(str).map((x) => BadmintonContestByAccepted.fromJson(x)));

String badmintonContestByAcceptedToJson(List<BadmintonContestByAccepted> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BadmintonContestByAccepted {
    BadmintonContestByAccepted({
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

    factory BadmintonContestByAccepted.fromJson(Map<String, dynamic> json) => BadmintonContestByAccepted(
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
