import 'dart:convert';

class SiteUsersResponse {
    SiteUsersResponse({
        required this.id,
        required this.name,
        required this.username,
        required this.image,
        required this.role,
        required this.online,
        required this.isActive,
    });
    String id;
    String name;
    String username;
    String image;
    String role;
    bool online;
    bool isActive;

    factory SiteUsersResponse.extraerInfo(json) => SiteUsersResponse(
        id       : json["users"]["_id"],
        name     : json["users"]["name"],
        username : json["users"]["username"],
        image    : json["users"]["image"],
        role     : json["users"]["role"],
        online   : json["users"]["online"],
        isActive : json["users"]["isActive"],
    );

}
