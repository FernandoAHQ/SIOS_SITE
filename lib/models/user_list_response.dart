import 'dart:convert';

import 'models.dart';

SiteUsers siteUsersFromJson(String str) => SiteUsers.fromJson(json.decode(str));

String siteUsersToJson(SiteUsers data) => json.encode(data.toJson());

class SiteUsers {
    SiteUsers({
        required this.status,
        required this.users,
    });

    bool status;
    List<User> users;

    factory SiteUsers.fromJson(Map<String, dynamic> json) => SiteUsers(
        status: json["status"],
        users: List<User>.from(json["users"].map((x) => User.convertirJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "users": List<dynamic>.from(users.map((x) => x.aJson())),
    };
}