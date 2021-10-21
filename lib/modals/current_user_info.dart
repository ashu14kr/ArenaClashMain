// To parse this JSON data, do
//
//     final currentUserData = currentUserDataFromJson(jsonString);

import 'dart:convert';

CurrentUserData currentUserDataFromJson(String str) => CurrentUserData.fromJson(json.decode(str));

String currentUserDataToJson(CurrentUserData data) => json.encode(data.toJson());

class CurrentUserData {
    CurrentUserData({
        required this.id,
        required this.name,
        required this.email,
        required this.phoneno,
        required this.password,
        required this.v,
    });

    String id;
    String name;
    String email;
    String phoneno;
    String password;
    int v;

    factory CurrentUserData.fromJson(Map<String, dynamic> json) => CurrentUserData(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneno: json["phoneno"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phoneno": phoneno,
        "password": password,
        "__v": v,
    };
}
